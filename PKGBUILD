# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=python-dot3k
pkgver=r115.d543fb3
pkgrel=1
pkgdesc="Library for the Display-o-tron Raspberry Pi add-on board from Pimoroni."
arch=('armv6h')
url="https://github.com/pimoroni/dot3k"
license=('GPL')
depends=('python' 'python-raspberry-gpio' 'python-sn3218' 'python-st7036')
makedepends=('python' 'git')
source=($pkgname::git://github.com/pimoroni/dot3k.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/python/library"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname/python/library"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
