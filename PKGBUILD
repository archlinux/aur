# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=python-simperium
pkgver=0.1.5
pkgrel=1
pkgdesc="Simperium client library for Python"
arch=('any')
url="https://git.sr.ht/~swalladge/python-simperium3"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~swalladge/python-simperium3/archive/v${pkgver}.tar.gz")
sha256sums=('f4088c97f6cbccfc46b35caf28c228769f2bb4504bb32eb20f722d24e195fa76')

build() {
    cd "${pkgname}3-v${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}3-v${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
