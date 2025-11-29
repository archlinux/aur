# Maintainer: Not_Noob <github.refusal864@passinbox.com>
pkgname=octarine-bin
pkgdesc="Octarine is an opinionated tool for taking notes, tasks and organising your thoughts."
pkgver=0.30.5
pkgrel=1
arch=("x86_64")
url="https://octarine.app"
source=("https://pub-3d35bc018fc54f11bde129e3e73e8002.r2.dev/${pkgver}/linux/Octarine-bin-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=("gtk3" "libappindicator-gtk3" "webkit2gtk-4.1" "xdotool")
md5sums=("SKIP")
options=(!debug)

prepare() {
	cd "$srcdir"
	tar -I zstd -xf "Octarine-bin-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
}

package() {
	# Desktop
	install -Dm644 "$srcdir/usr/share/applications/Octarine.desktop" "$pkgdir/usr/share/applications/octarine.desktop"

	# Icons
	install -Dm644 "$srcdir/usr/share/icons/hicolor/128x128/apps/octarine.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/octarine.png"
	install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256@2/apps/octarine.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/octarine.png"
	install -Dm644 "$srcdir/usr/share/icons/hicolor/32x32/apps/octarine.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/octarine.png"

	# Executable
	install -Dm755 "$srcdir/usr/bin/octarine" "$pkgdir/usr/bin/octarine"
}
