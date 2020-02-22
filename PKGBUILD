# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: jdkaplan <jdkaplan@metagram.net>

pkgname=tako-git
_gitname=tako
pkgver=r3747.50bc4f7b
pkgrel=1
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://takoshell.org/index.html"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'git')
conflicts=('tako')
install=tako.install
source=("git://hz.mit.edu/$_gitname.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  python setup.py build
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
