# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='python-rq'
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple job queues for Python"
arch=('any')
license=('BSD')
url="https://github.com/rq/rq/"
makedepends=('python' 'python-setuptools' 'python-click' 'python-redis')
depends=('python' 'python-click' 'python-redis')
source=("${url}archive/v${pkgver}.tar.gz")
sha256sums=('ce94d07125b96313e8c4512b30c62da290ae6f5eeff60b8c3e2a0a08055f5608')

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
