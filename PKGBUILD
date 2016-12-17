# Maintainer: Tyler O'Meara <arch at tyleromeara dot com>
pkgname="berachs-complete-pidgin-git"
pkgver=r141.3c0df5c
pkgrel=1
pkgdesc="Emote package for the Pidgin IM client"
arch=('any')
url="https://github.com/Berach/BERACHS_COMPLETE_PIDGIN"
license=('unknown')
depends=('pidgin>=2.0.0')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${pkgname}.install
source=('git+https://github.com/Berach/BERACHS_COMPLETE_PIDGIN.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/BERACHS_COMPLETE_PIDGIN"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"
        mkdir -p "$pkgdir"/usr/share/pixmaps/pidgin/emotes
	cp -r "BERACHS_COMPLETE_PIDGIN" "$pkgdir"/usr/share/pixmaps/pidgin/emotes
}
