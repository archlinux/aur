# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.6.6
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

b2sums_x86_64=('423a2996ae0d36f5dd9530111d2a44d8eba71060b2b2399f577086cd3603768b7f82d07dcb2fc4287478e925982dae1136994866116aaa694cede8c861e3acb7')
b2sums_i686=('7837beed9045fc037cb962669ba63df23a686a48ded5cfcb0a33e969b0a215ce144197d6705c2d951961c924e894889b3eecccac89ec6d6121a93a0917d9d0fc')
b2sums_aarch64=('cb4e1e2ce62d42d62ff7378624b5cf1ba43c455914b1a30b5118df181af87ece00cd7780824d973e7db18b88287cca5acd6272196305db1c4d6737c55c0b9e83')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
