# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-whynot
pkgver=2021.02.12
_pkgver=6511
pkgrel=1
pkgdesc="Aims to get all existing high quality mods working together"
arch=("any")
url="https://content.minetest.net/packages/bell07/whynot_game/"
license=("GPLv3")
depends=("minetest-common")
source=("whynot-$_pkgver.zip::https://content.minetest.net/packages/bell07/whynot_game/releases/${_pkgver}/download/")
sha256sums=('e7fcd73aeae0d7becc43869d0b5555c3981ec5f79847390dd3eb5727deb7634d')
options=(!strip)

package() {
	cd whynot_game
	find . -type f | while read f; do
		install -Dm644 "$f" "${pkgdir}/usr/share/minetest/games/whynot/$f"
	done
}
