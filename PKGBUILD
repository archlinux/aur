# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.6.5
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

b2sums_x86_64=('189fa8c8d11cfad5224047874c40d365d36589478d3bbda1cb0ee906df301dda7a7fa60503d637a75b0df49bfbbf94500ae5f4d84957a1ebe483ffa04371bd53')
b2sums_i686=('ecbc2c33791a0a80695e7e7884028a43237bda4031ffbc16851dd12875e51403ad3bfe2bdc0d07906a855a735fd5ba6bd10478c16536bc8b05db986226117cc1')
b2sums_aarch64=('ad2060c0e204fe880c6fc5c128930a9115687ee148bc2a37a02618661b12033895d606ade2292de4ac32c429508d23887f31f5e91007742b8ca611a9d42efc76')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
