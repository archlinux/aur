# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=python-pkgbuild-git
pkgver=r7.7afcd99
pkgrel=1
pkgdesc="Python library to parse pacman's .SRCINFO file"
arch=('any')
url="https://github.com/z3ntu/python-pkgbuild"
license=('MIT')
depends=('python')
makedepends=('git')
options=(!emptydirs)
source=(git+https://github.com/z3ntu/python-pkgbuild)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/python-pkgbuild"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/python-pkgbuild"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
