# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop-bin
pkgver=1.1
pkgrel=1
pkgdesc="Experimental Telegram Desktop fork."
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPLv3)
depends=(
    desktop-file-utils
    glib2
    hicolor-icon-theme
    libdbus
    libx11
)
makedepends=(
    chrpath
)
optdepends=(
    'libappindicator-gtk2: to hide Telegram in the tray bar (GTK2-based desktop environment)'
    'libappindicator-gtk3: to hide Telegram in the tray bar (GTK3-based desktop environment)'
    'libappindicator-sharp: to hide Telegram in the tray bar (Unity-based desktop environment)'
    'xdg-utils: for automatic opening of URLs, files and directories in proper applications'
)

source=(

"$pkgname"-"$pkgver".tar.gz::"$url"/releases/download/k"$pkgver"/"$pkgver".tar.xz
"$pkgname".desktop

)

sha256sums=(

'b2cd1949f1ec1110fd9453a45c7963008467222308c5a0199cde34ba606e22ac'
'6b40ccc530a891d376b0d34f13ec09223a769a9f42fa0a82a173a33bc8032bd6'

)

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"

	# Program
	install -Dm755 "$srcdir/Kotatogram/Kotatogram" "$pkgdir/usr/bin/kotatogram-desktop"
    
    # Desktop launcher
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"
}
