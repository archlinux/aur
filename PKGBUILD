# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.7.1
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums_x86_64=('1d6fd6b2f8e0ae185476ed9b09d2a18d6e405db1e6e459822b3e51a170ca4650dcc9ec252d04e80dc9d7c305a734c879b8599bbededba339dea55a979f44db61')
b2sums_i686=('d27c5a815458e985b502b1f5d62edc9eab7dcd49f5527bde030fc42a65116364f25de213c90d929cc2ace3f84e50ef4c0b32a259623c35de389b857604abd54b')
b2sums_aarch64=('f7fbe81c0eb06f3a87ee4ef19746dc955f4ecf50dd67bd1693d150972eebd7260c62bed274958157da82cc2f5da86be76830bcbbce4ddcd8c6fba1fdb5988b86')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENCE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
