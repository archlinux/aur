# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=ritchie-git
_gitname=ritchie
pkgver=0.r186.87330bd
pkgrel=1
pkgdesc="the power of C language and the convenience of a high level language"
arch=('i686' 'x86_64')
url="https://github.com/riolet/ritchie"
license=('unknown')
provides=('ritchie')
makedepends=('git')
source=('git://github.com/riolet/ritchie.git')
md5sums=('SKIP')
 
pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr/
}
 
package() {
  cd "$srcdir/$_gitname"
  install -Dm755 ritc "$pkgdir/usr/bin/ritc"
  install -Dm755 ritchie.sh "$pkgdir/usr/bin/ritchie"
  install -Dm644 highlighting/ritchie.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/ritchie.lang"
}
