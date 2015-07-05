pkgname=gottengeography
pkgver=2.5
pkgrel=1
pkgdesc='Automagically geotag photos with GPX data.'
arch=('any')
url='http://exolucere.ca/gottengeography/'
license=('GPL3')
depends=('python' 'python-gobject' 'python-dateutil' 'libchamplain>=0.12.2' 'libgexiv2' 'desktop-file-utils' 'hicolor-icon-theme' 'dconf')
makedepends=('python-distutils-extra')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/robru/gottengeography/tarball/v$pkgver")
sha256sums=('3ceb26929efdcdd66c903e957932e3a38db04bf7f74044a410eafc9778a53bc2')

package() {
  local dirname=$(tar tf "$srcdir/$pkgname-$pkgver.tar.gz" | sed 1q);
  cd "$srcdir/$dirname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
