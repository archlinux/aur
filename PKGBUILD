# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

pkgname="python-gogs-client"
pkgver=1.0.4
pkgrel=1
pkgdesc="Python client for Gogs server"
arch=("any")
url="https://github.com/unfoldingWord-dev/python-gogs-client"
license=("MIT")
depends=("python-future" "python-requests")
makedepends=("python-setuptools")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/unfoldingWord-dev/python-gogs-client/archive/v${pkgver}.tar.gz")
sha512sums=("19d0ff2a77fe8fd12b5f87765ca7ae87102a9f8478e76eb938c9a75aa89ab42ab05ff95d2420d3737b13fae776564834ae84f41360d978f1f9fbbfca2e889192")

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
