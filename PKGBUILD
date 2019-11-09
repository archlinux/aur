# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop
pkgver=1.1
pkgrel=2
pkgdesc="Experimental Telegram Desktop fork."
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPLv3)
# depends=() 

source=(

"$pkgname"-"$pkgver".tar.gz::"$url"/releases/download/k"$pkgver"/"$pkgver".tar.xz
"$pkgname".desktop

)

sha256sums=(

'SKIP'
'SKIP'

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
