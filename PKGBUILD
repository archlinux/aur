# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=tmenu-git
pkgver=20140614
pkgrel=1
pkgdesc="Fuzzy completion for anything in the terminal, like dmenu."
arch=('i686' 'x86_64')
url="https://github.com/dhamidi/tmenu"
license=('GPL3')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/dhamidi/tmenu")
md5sums=('SKIP')

_gitname="tmenu"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"
  #./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  # ignores DESTDIR, abuse prefix instead
  make PREFIX="$pkgdir/usr/" install
  
}

# vim:set ts=2 sw=2 et:
