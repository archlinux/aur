# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=python-qtwaitingspinner-git
pkgver=r85.79a5c81
pkgrel=1
pkgdesc="A waiting spinner for PyQt5"
arch=('any')
url="https://github.com/z3ntu/QtWaitingSpinner"
license=('MIT')
makedepends=('git')
depends=('python')
options=(!emptydirs)
source=(python-qtwaitingspinner::git+https://github.com/z3ntu/QtWaitingSpinner)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/python-qtwaitingspinner"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/python-qtwaitingspinner"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
