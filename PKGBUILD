# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='python2-rq'
pkgver=0.10.0
pkgrel=1
pkgdesc="Simple job queues for Python"
arch=('any')
license=('BSD')
url="https://github.com/rq/rq/"
makedepends=('python2' 'python2-setuptools' 'python2-click' 'python2-redis')
depends=('python2' 'python2-click' 'python2-redis')
source=("${url}archive/v${pkgver}.tar.gz")
sha256sums=('71fb6a14354013106655efd3eccd028fcea81f1dab0aaf14ecb26ec15ebd4bfc')

package() {
    cd "${srcdir}/rq-${pkgver}"

    python2 setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq"{,2}
    mv "${pkgdir}/usr/bin/rqinfo"{,2}
    mv "${pkgdir}/usr/bin/rqworker"{,2}
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
