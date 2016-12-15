# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>
# Contributer: NicoHood <aur {at} nicohood {dot} de>
pkgname=python2-pyqrcode
pkgver=1.2.1
pkgrel=1
pkgdesc="A QR code generator written purely in Python with SVG, EPS, PNG and terminal output."
arch=('any')
url="https://github.com/mnooner256/pyqrcode"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools' 'unzip')
source=("https://pypi.python.org/packages/06/76/1aa11ac094c65005b5d8a042b8bd96d73d4e2c32d9a63a68b21278e4b7d2/PyQRCode-${pkgver}.zip")
sha512sums=('bb9239621d5a26a2bc302c1435c6ffccf4e48bb6ee8c52fde0302864f723f1458d5611932469ff35c85cb1eb8302f2f02b93d6ffac0faefb82d7f488471fa71e')

build() {
  cd "$srcdir/PyQRCode-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/PyQRCode-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
