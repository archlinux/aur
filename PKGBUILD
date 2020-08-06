# Maintainer: otreblan <otreblain@gmail.com>

pkgname=nerd-fonts-inconsolata-go
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font InconsolataGo from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=(
	'fontconfig'
	'wget'
	'xorg-bdftopcf'
	'xorg-font-util'
	'xorg-mkfontdir'
	'xorg-mkfontscale'
)

source=(
	"InconsolataGo-v$pkgver.zip::$url/releases/download/v$pkgver/InconsolataGo.zip"
	"$url/raw/v$pkgver/LICENSE"
)

sha256sums=(
	'b5483ade3759fdcab372dab143347e4a021f2d16442be9a96a0235414487de30'
	'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5'
)

package() {
	rm "$srcdir/"*Compatible.ttf

	install -d "$pkgdir/usr/share/fonts/TTF"
	install -d "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
