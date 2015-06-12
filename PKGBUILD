# Maintainer: Ariel Popper <a@arielp.com>

_gitname=termite

pkgname=termite-terminfo-git
pkgver=20130516
pkgrel=2
pkgdesc="Just the terminfo for termite (A Simple VTE-based terminal)"
arch=('any')
url="https://github.com/thestinger/termite/"
license=('LGPL')
makedepends=('ncurses' 'git')
source=("$_gitname::git+https://github.com/thestinger/termite")
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/$_gitname"
	git log -1 --format="%cd" --date=short termite.terminfo | sed 's|-||g'
}

package() {
	install -d "$pkgdir/usr/share/terminfo/x"
	tic -x "$srcdir/$_gitname/termite.terminfo" -o "$pkgdir/usr/share/terminfo"
}
