# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.6.4
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

b2sums_x86_64=('8906d50c21c165cb91a96e43521ca5c8cf495fad6dc365f58c9601622b0023df014f42b99a3003c0363d40e3d2983a158cfcb97de7c9ff336f15e69a05f1aeac')
b2sums_i686=('356c0d35c2873367f6ed891efbe2eafef15acfd1aa7ad4604a1b4557839ec280a6001ee71f697d56ec5b9f308d6c178f4a6282119cdabac4585a270c04ccf586')
b2sums_aarch64=('546f325a8473b1cd018cbf324b812bd373511ff637e57bea18c1f75935bfd1187a8827a2552e479d1010873742231a51010e57d37defdfa0c1104bf5cb1beb6b')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
