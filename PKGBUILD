# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="pingtop"
pkgver="0.3.0"
pkgrel=1
pkgdesc="Ping multiple servers and show results in a top-like terminal UI."
arch=("any")
url="https://pypi.org/project/pingtop/"
source=("https://github.com/laixintao/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("4658059e8252cf897f5803cc9717bb5df5e4800f30ebf59c055e3373dae79b98")
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
