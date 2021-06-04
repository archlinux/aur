# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="pingtop"
pkgver="0.4.0"
pkgrel=1
pkgdesc="Ping multiple servers and show results in a top-like terminal UI."
arch=("any")
url="https://pypi.org/project/pingtop/"
source=("https://github.com/laixintao/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("5bc1923d3fc9b53d56681a45ff403550bb893b68508c63760f8636f3e32387cf")
license=("MIT")
depends=("python" "python-click" "python-panwid")
makedepends=("python-setuptools")

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
