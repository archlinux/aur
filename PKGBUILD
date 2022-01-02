# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
pkgname=kmonad-bin
pkgver=0.4.1
pkgrel=3
pkgdesc="An advanced keyboard manager - static binary version"
arch=('x86_64')
url="https://github.com/kmonad/kmonad"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/kmonad/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-linux"
	"https://github.com/kmonad/${pkgname%-bin}/archive/$pkgver.tar.gz")
md5sums=('SKIP'
	 'SKIP')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname%-bin}-$pkgver-linux" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "${pkgname%-bin}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "${pkgname%-bin}-$pkgver/doc/faq.md" "$pkgdir/usr/share/doc/$pkgname/faq.md"

	install -Dm755 "${pkgname%-bin}-$pkgver/keymap/tutorial.kbd" "$pkgdir/usr/share/doc/$pkgname/keymap/tutorial.kbd"

	for file in "${pkgname%-bin}-$pkgver/keymap/template/"*.kbd; do
	  install -Dm755 "$file" -t "$pkgdir/usr/share/doc/$pkgname/keymap/template"
	done
}

