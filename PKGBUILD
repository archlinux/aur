# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-tutorial
pkgver=3.1.1
_pkgver=6785
pkgrel=1
pkgdesc="Learn how to play Minetest."
arch=("any")
url="https://content.minetest.net/packages/Wuzzy/tutorial/"
license=("GPLv2")
depends=("minetest-common")
source=("tutorial-$_pkgver.zip::https://content.minetest.net/packages/Wuzzy/tutorial/releases/${_pkgver}/download/")
sha256sums=('ff4ede8cd9d820bade6adf10f2404f15b3e847497dfb995ad48a43021f90c179')
options=(!strip)

package() {
	cd tutorial
	find . -type f | while read f; do
		install -Dm644 "$f" "${pkgdir}/usr/share/minetest/games/tutorial/$f"
	done
}
