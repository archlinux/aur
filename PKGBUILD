# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=alephium-wallet-bin
pkgdesc="The official Alephium desktop wallet."
pkgver=0.11.1
pkgrel=2
arch=('x86_64')
url="https://github.com/alephium/alephium-wallet"
license=('LGPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/alephium/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")
sha256sums_x86_64=('2ffa3a3a5a7a7e6fc61f3a268176f4cc7bb0699480156ad40a16bd306d07f417')

package() {
	tar -xf data.tar.xz -C "$pkgdir"

	# Fix the icon installation path
	install -Dm644 "$pkgdir/usr/share/icons/hicolor/0x0/apps/${pkgname%-wallet-bin}.png" \
	  -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
	rm -r "$pkgdir/usr/share/icons/hicolor/0x0"
}
