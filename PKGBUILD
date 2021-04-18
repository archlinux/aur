# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-infinite-ikea
pkgver=0.0.3
pkgrel=1
pkgdesc="Survival horror game based on SCP-3008."
arch=("any")
url="https://content.minetest.net/packages/benrob0329/ikea/"
license=("MIT")
depends=("minetest-common")
source=("ikea-${pkgver}.zip::https://gitlab.com/benrob0329/ikea/-/archive/${pkgver}/ikea-${pkgver}.zip")
sha256sums=('6d022a44ba2cd7bfabd035d5ebb813e152b27207b58afef0cbde1f3bcbeb520e')
options=(!strip)

package() {
	cd "ikea-${pkgver}"
	for f in $(find . -type f); do
		install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/ikea/$f"
	done
}
