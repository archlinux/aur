# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='python-rq'
pkgver=0.10.0
pkgrel=1
pkgdesc="Simple job queues for Python"
arch=('any')
license=('BSD')
url="https://github.com/rq/rq/"
makedepends=('python' 'python-setuptools' 'python-click' 'python-redis')
depends=('python' 'python-click' 'python-redis')
source=("${url}archive/v${pkgver}.tar.gz")
sha256sums=('71fb6a14354013106655efd3eccd028fcea81f1dab0aaf14ecb26ec15ebd4bfc')

package() {
    cd "${srcdir}/rq-${pkgver}"

    python setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq"{,3}
    mv "${pkgdir}/usr/bin/rqinfo"{,3}
    mv "${pkgdir}/usr/bin/rqworker"{,3}
    ln -s "/usr/bin/rq3" "${pkgdir}/usr/bin/rq"
    ln -s "/usr/bin/rqinfo3" "${pkgdir}/usr/bin/rqinfo"
    ln -s "/usr/bin/rqworker3" "${pkgdir}/usr/bin/rqworker"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
