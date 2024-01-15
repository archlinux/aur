# Maintainer: Rsplwe <i@rsplwe.com>

pkgname=snipaste
pkgver=2.8.9_Beta
pkgrel=1
pkgdesc="Snip & Paste!"
arch=('x86_64')
url="https://www.snipaste.com"
license=('custom')

depends=(fuse2)
makedepends=()
# optdepends=()
options=(!strip)

source_x86_64=(
	"${pkgname}-${pkgver}-x86_64.AppImage::https://download.snipaste.com/archives/Snipaste-2.8.9-Beta-x86_64.AppImage"
	"snipaste.desktop"
	"snipaste.png"
	"snipaste"
)
sha256sums_x86_64=(
	"420d9c7cebe930fabf64b48ff2702004c9964c60c4e5cab75ba60e5fa6727f09"
	"2f2f9aebca52e156644c95f3b59339a9948293de3ec70ac5ad38cc2c9cfd68b7"
    "d48295bddc8dfc7108e281950d21b76224772c9406ccee4028350f96d3facc4a"
	"a7b331657c84957fa0f1c1979549071e9f9a00c1c9ee577fd26fbebec83708c9"
)

_binary="${pkgname}-${pkgver}-${arch}.AppImage"
noextract=("${_binary}")

package() {
	cd "$srcdir"

	install -Dm755 "$_binary" "$pkgdir/opt/snipaste/Snipaste.AppImage"
	install -Dm755 -t "$pkgdir/usr/bin" snipaste
	install -Dm644 snipaste.png "$pkgdir/usr/share/pixmaps/snipaste.png"
	install -Dm644 -t "$pkgdir/usr/share/applications" snipaste.desktop
}
