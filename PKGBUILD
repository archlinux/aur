# Maintainer: Nova King <technobaboo@proton.me>

pkgname="stardust-xr-telescope"
pkgver="0.1.0"
pkgrel="2"
pkgdesc="See the stars! Simple Stardust XR overlay setup."
arch=("any")
url="https://github.com/StardustXR/telescope"
license=("MIT")
depends=(
	"bash"
	"stardust-xr-server"
	"stardust-xr-flatland"
	"stardust-xr-gravity"
	"stardust-xr-protostar"
	"stardust-xr-black-hole"
	"xwayland-satellite"
)
makedepends=(
	"git"
)
source=("git+https://github.com/StardustXR/telescope.git")
sha256sums=("SKIP")
OPTIONS=(!debug)

package() {
	cd "${srcdir}/telescope"
	install -Dm755 "scripts/telescope" "$pkgdir/usr/bin/telescope"
	install -Dm755 "scripts/_telescope_startup" "$pkgdir/usr/bin/_telescope_startup"
	install -Dm644 \
		LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 \
		README.md \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
}
