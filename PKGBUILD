# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=zet-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='CLI utility to find the union, intersection, set difference, etc of files considered as sets of lines'
arch=('x86_64')
url="https://github.com/yarrow/${pkgname%-bin}"
license=('APACHE' 'MIT')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.xz")

b2sums_x86_64=('cc6c1d91e86e09a6721fd8e1843a620164d9576374269a5bcbcbe27c0b883559fd554735bffffa688ff38c65bbd55b7179cc3f59e412dd8849959b9241b89c13')

package() {
	cd "${pkgname%-bin}-v$pkgver-"*
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
