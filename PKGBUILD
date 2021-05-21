# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="Cross-platform command-line tool for batch renaming files and directories quickly and safely"
arch=(x86_64 i686 aarch64)
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums_x86_64=('9dda70989acc82cd6fa1e8b147c4ae70d8557fb0b6183c9c4bc485d0a6a980da11d643872c6b3d5df8feb52f9b863d17cc37302588fd7a37b8751407becb0c55')
b2sums_i686=('4378a03f95208537e05ad3590afcdd5835e061e443a0581d9a175a37fea1af0860a070b1d539ea5cb9c02c69dd04ec9f33f0567f94e924044f3df0de635d9cee')
b2sums_aarch64=('ad0a11188e1755b675fc845326f3ff5b556241fd0887bf638b228085ef6341784bbf03fd8cedfae007618ccf0b4a628a57aa6f309d0ec1e90751cce2a27088f0')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
