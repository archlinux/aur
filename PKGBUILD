# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Michael Goehler <somebody dot here at gmx dot de>

pkgname=python-st7036
pkgver=1.4.4
pkgrel=1
pkgdesc="Python bindings for ST7036 LCD."
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/pimoroni/st7036"
license=('GPL')
depends=('python' 'python-spidev' 'python-raspberry-gpio')
makedepends=('python' 'git')
source=("https://github.com/pimoroni/st7036/archive/v$pkgver.tar.gz")
sha256sums=('cb73aed42480f57f03e14c1a3ee7b93a55cddd8a326ac54dba6eeadcdf748bc7')

build() {
  cd "$srcdir/$pkgname/python"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname/python"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
