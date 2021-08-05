# Maintainer: Taigah Dev <taigah dot dev at gmail dot com>
_pkgname=sdl2-manpage
pkgname=sdl2-manpage-git
pkgver=r183.eea3062
pkgrel=1
pkgdesc="Man-pages generated for SDL2."
arch=("x86_64")
url="https://github.com/haxpor/sdl2-manpage"
license=('MIT')
makedepends=('git')
source=("$_pkgname::git+https://github.com/haxpor/sdl2-manpage.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/share/man/man3"
  install -m644 src/*.3 "$pkgdir/usr/share/man/man3"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

