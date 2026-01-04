# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=zet-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='CLI utility to find the union, intersection, set difference, etc of files considered as sets of lines'
arch=('x86_64')
url="https://github.com/yarrow/${pkgname%-bin}"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")

b2sums_x86_64=('a23ad8a1718983975a6ac59a67daf5e026983818062f44b9306b85605ab7d295974983ba36600f0a3e8719c378adb2478d93e85be55c5fed0fb977b6d92252e9')

package() {
	cd "${pkgname%-bin}-x86_64-unknown-linux-gnu"

	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
