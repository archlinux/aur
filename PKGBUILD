# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=drawille-git
pkgver=r115.7f5714a
pkgrel=1
pkgdesc="Pixel graphics in terminal with unicode braille characters"
arch=('any')
url="https://github.com/asciimoo/drawille"
license=('GPL3')
makedepends=('git')
depends=('ncurses' 'python' 'python-setuptools')
source=('git+https://github.com/asciimoo/drawille.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/drawille"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/drawille"
   python setup.py install --root="$pkgdir/" --optimize=1
}
