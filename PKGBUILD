# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=python-libdesktop-git
_pkgname=libdesktop
pkgver=r47.0f411e4
pkgrel=1
pkgdesc="OS and desktop integration made easy."
arch=('any')
url="https://github.com/bharadwaj-raju/libdesktop"
license=('MIT')
depends=('python')
makedepends=('git')
optdepends=("pygtk" "python-pyqt4" "python-pyqt5" "python-gobject")
options=(!emptydirs)
source=("git+https://github.com/bharadwaj-raju/libdesktop")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
