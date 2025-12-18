# Maintainer: Nova King <technobaboo@proton.me>

pkgname="stardust-xr-telescope"
pkgver="0.50.1"
pkgrel="1"
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
	"stardust-xr-non-spatial-input"
	"stardust-xr-solar-sailer"
	"xwayland-satellite"
)
makedepends=(
	"git"
)
source=("git+https://github.com/StardustXR/telescope.git#tag=$pkgver")
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

	install -Dm644 \
		org.stardustxr.Telescope.desktop \
		"$pkgdir/usr/share/applications/org.stardustxr.Telescope.desktop"
	install -Dm644 \
		org.stardustxr.Telescope.png \
		"$pkgdir/usr/share/icons/hicolor/512x512/apps/org.stardustxr.Telescope.png"
}
