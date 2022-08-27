# Maintainer: otreblan <otreblain@gmail.com>

pkgname=nerd-fonts-inconsolata-go
pkgver=2.2.1
pkgrel=2
pkgdesc="Patched font InconsolataGo from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=()

source=(
	"InconsolataGo-v$pkgver.zip::$url/releases/download/v$pkgver/InconsolataGo.zip"
	"$url/raw/v$pkgver/LICENSE"
)

sha256sums=('a122b4874cbc648cf83e4ea1e06a40912a42a28c21657dd08c6616e35b717480'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
	rm "$srcdir/"*Compatible.ttf

	install -d "$pkgdir/usr/share/fonts/TTF"
	install -d "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
