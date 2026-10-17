# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=PcbDraw
pkgname=pcbdraw
pkgver=1.3.0
pkgrel=1
pkgdesc="Convert your KiCAD board into a nicely looking 2D drawing suitable for pinout diagrams"
arch=('any')
url="https://github.com/yaqwsx/$_pkgname"
license=('MIT')
depends=(
  'kicad' 'python3'
  'python-numpy' 'python-lxml' 'python-mistune'
  'python-pybars3' 'python-yaml' 'python-click'
  'python-svgpathtools' 'python-pcbnewtransition'
  'python-pyvirtualdisplay' 'python-pillow' 'python-wxpython'
)
optdepends=('inkscape')
makedepends=('python-setuptools' 'python-wheel' 'python-pytest')
options=('!strip' '!emptydirs')
provides=('pcbdraw')
conflicts=('pcbdraw')

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha512sums=(
  'a1c1b566e5fa6a632fb6907dcec319093d061eab37364ee247deef2cdcd84b568f737ebf9a1ee17c85b766973943d2f7a9f27f970bc225f85bfb19f818a0e854'
)

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: set ts=2 sw=2 et:
