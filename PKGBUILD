# Maintainer: otreblan <otreblain@gmail.com>

pkgname=nerd-fonts-inconsolata-go
pkgver=2.3.0
pkgrel=1
pkgdesc="Patched font InconsolataGo from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=()

source=(
	"InconsolataGo-v$pkgver.zip::$url/releases/download/v$pkgver/InconsolataGo.zip"
	"$url/raw/v$pkgver/LICENSE"
)

sha256sums=('9e7b3924b570e549d76902a182bbcbb9ad3f2e673f481643302e349625c04de0'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
	rm "$srcdir/"*Compatible.ttf

	install -d "$pkgdir/usr/share/fonts/TTF"
	install -d "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
