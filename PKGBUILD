# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.7.0
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

b2sums_x86_64=('eb6354200147a98adab3fb67b89e5563783dccd5f8cf961c63167d8e7fadc010a0d565f829a4f09bd85e217afa234112e34eb369482c10361c614c394821da3b')
b2sums_i686=('2f762fef985294d8057aae45b6160f18c61091b1d8aa5b730b0602d98353ce40ead21ba9e9ee23fa0abd4d456d7aedb9f196adc87dfba1701c519a65aafe901c')
b2sums_aarch64=('0c770c1c4c47a402a7b4c5f4a7103c8188db2c30860ae3b8dc925d53c82f6457792a36019272714d29f59943eda703eda69d2605eea8c7e25ad30d9ad3dffaab')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENCE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
