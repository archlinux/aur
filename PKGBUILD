# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=python-st7036
pkgver=r20.a33546b
pkgrel=1
pkgdesc="Python bindings for ST7036 LCD."
arch=('armv6h')
url="https://github.com/pimoroni/st7036"
license=('GPL')
depends=('python' 'python-spidev' 'python-raspberry-gpio')
makedepends=('python' 'git')
source=($pkgname::git://github.com/pimoroni/st7036.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/python"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname/python"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
