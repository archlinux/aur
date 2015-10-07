# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
_gitname=ddb_quick_search
pkgbase=deadbeef-quick-search-git
pkgver=12.e31f35c
pkgrel=1
pkgname=('deadbeef-quick-search-gtk2-git' 'deadbeef-quick-search-gtk3-git')
pkgdesc="Quick Search Plugin for the DeaDBeeF Audio Player"
arch=('i686' 'x86_64')
url="https://github.com/cboxdoerfer/ddb_quick_search"
license=('GPL2')
depends=('deadbeef')
source=('git+https://github.com/cboxdoerfer/ddb_quick_search.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}



build() {
  cd "${srcdir}/$_gitname"
  make all
}

package_deadbeef-quick-search-gtk2-git() {
  pkgdesc=$_pkgdesc' The GTK2 version.'
  install -D -m644 $srcdir/$_gitname/gtk2/ddb_misc_quick_search_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_misc_quick_search_GTK2.so
}

package_deadbeef-quick-search-gtk3-git() {
  pkgdesc=$_pkgdesc' The GTK3 version.'
  install -D -m644 $srcdir/$_gitname/gtk3/ddb_misc_quick_search_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_quick_search_GTK3.so
}