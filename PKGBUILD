# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=python-sn3218
pkgver=r11.656910a
pkgrel=1
pkgdesc="Python bindings for SN3218 18-channel PWM LED driver."
arch=('armv6h')
url="https://github.com/pimoroni/sn3218"
license=('GPL')
depends=('python' 'python-smbus')
makedepends=('python' 'git')
source=($pkgname::git://github.com/pimoroni/sn3218.git)
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
