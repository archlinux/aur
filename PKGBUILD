# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=f2-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver-LICENCE::${url/github/raw.githubusercontent}/v$pkgver/LICENCE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums=('1375f8eb689085b7735551ce0f5f19167df905bdf8f105ac72479ae6214666f74a03ce24766bc08a9407c878ecd8078ca3e81013ecf4fd8c80a52dc308e29d78')
b2sums_x86_64=('ba65c18968a9bedf7f35ad6ac88a40489dde8abc499dc7d3286bbe766689e2ef7ab506fc568f6de17c89744de0a6f48e9653f1cd3818ba6567864d80085853e2')
b2sums_i686=('1e43776233a73c9b5379423289cce2c040b6b665687fc8c5d06e153e5982846c891643e6a2621dc650296ef5e80bc49d4f6cd6a33b122f398a1c52d0bf0f1dbe')
b2sums_aarch64=('8e0e1d7e20e853705f9cb2b200aed429c6fe05fc7ecd7753a30e827318234f690eed7a2d09c776f0518d33dd0673998f66cd8ba9849de8cf654628cdd8d7d241')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver-LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
