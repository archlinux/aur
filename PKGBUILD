# Maintainer: Maki <maki@hotmilk.space>

pkgname=ttf-old-timey-mono
pkgver=0.11.0
pkgrel=1
pkgdesc="A clean monospace typeface based on Reproducing Typewriter which was available as early as 1906."
arch=("any")
url="https://github.com/dse/old-timey-mono-font"
license=("OFL")
# source=("https://github.com/dse/old-timey-mono-font/releases/download/$pkgver/OldTimeyMono-$pkgver.zip")
source=(
	"https://github.com/dse/old-timey-mono-font/raw/refs/heads/master/dist/zip/OldTimeyMono-$pkgver.zip"
	"https://github.com/dse/old-timey-mono-font/raw/refs/tags/v$pkgver/LICENSE.md"
)
sha256sums=('f7bf23bf4a98922bf2616baa5d579d2655e32cdef5ebf6de6becd7949b9b3ff9'
            '7d048b5cd92233107c231d776db9a306b56572377a25b59bf3ab84298a815613')

package() {
	install -Dm644 OldTimeyMono-$pkgver/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	# install -Dm644 OldTimeyMono-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	cd "$pkgdir/usr/share/licenses/$pkgname"
	mv LICENSE.md LICENSE
}
