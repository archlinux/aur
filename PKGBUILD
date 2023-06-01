# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=zet-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI utility to find the union, intersection, set difference, etc of files considered as sets of lines'
arch=('x86_64')
url="https://github.com/yarrow/${pkgname%-bin}"
license=('APACHE' 'MIT')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.xz")

b2sums_x86_64=('9ab4b51cc186821ff56c2b9ddb3cc33b5a528dcae7e69a3d0f550d47ad4d6910b73326ed174a6948f9dfaa0b47ebf7f7d94a330027b3a48d4835fc79b934a0c3')

package() {
	cd "${pkgname%-bin}-v$pkgver-"*
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
