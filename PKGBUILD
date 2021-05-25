# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.6.4
pkgrel=2
pkgdesc="Cross-platform command-line tool for batch renaming files and directories quickly and safely"
arch=(x86_64 i686 aarch64)
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums_x86_64=('fc57857c3ce9601d8b861be021bb2214cc0f0a4ef7a410279f5f28c1f611a7623cf560a323789e9d6751363a55d696eb3e9684e7c997f9eae2c1bcf241360ef1')
b2sums_i686=('852ea379513b119a949c3bf65e1f10f10a08152a3a769ac1e5ab926f732ef4cd45a8a98278121568d97c9f0bb6418651fa9629c185e33d0d003e2d10a0264ca8')
b2sums_aarch64=('56dfebe818122c02123b20cac5713500e12ebc51ff9ee59684df422a8e7d549807913898196179304ebb89986e38663bca34cfec8109647e8d09fe72db9ac590')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
