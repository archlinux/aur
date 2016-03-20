# Maintainer: Tetsumi <tetsumi@vmail.me>
#
pkgname=wren-git
_gitname=wren
pkgver=0
pkgrel=1
pkgdesc="Wren is a small, fast, class-based concurrent scripting language"
arch=("i686" "x86_64")
url="http://munificent.github.io/wren/"
source=("git://github.com/munificent/wren.git")
md5sums=('SKIP')

build() {
  cd $_gitname
  make
}

package() 
{
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/include"
  install -Dm755 "$srcdir/$_gitname/bin/wren" "$pkgdir/usr/bin/wren"
  install -Dm755 "$srcdir/$_gitname/lib/libwren.a" "$pkgdir/usr/lib/libwren.a"
  #install -Dm755 "$srcdir/$_gitname/lib/libwren.so" "$pkgdir/usr/lib/libwren.so"
  install -Dm755 "$srcdir/$_gitname/src/include/wren.h" "$pkgdir/usr/include/wren.h"
}
 
