# Maintainer: Brad Pitcher <bradpitcher@gmail.com>
# Contributer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-svg.path
pkgver=6.2
pkgrel=1
pkgdesc="SVG path objects and parser"
url="https://github.com/regebro/svg.path"
license=('MIT')
checkdepends=(python-pillow python-pytest)
depends=(python)
makedepends=(python-setuptools)
arch=(any)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7c9a67467e888f4961d54daf2706125c4ae21bb0cd1010f335eb072df78f12b1da99ddcf64a33a85a0e82a8b347f19e876161e3da8ebf43e5e7b45bbaf7d3325')

build() {
  cd "svg.path-${pkgver}"
  python setup.py build
}

check() {
  cd "svg.path-${pkgver}"
  python setup.py test
}

package() {
  cd "svg.path-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
