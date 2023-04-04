# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=stpv-git
pkgver=r125.5c6058c
pkgrel=1
pkgdesc="File previewer for lf, fzf and the terminal"
arch=('x86_64')
url="https://github.com/Naheel-Azawy/stpv"
license=('GPL')
depends=('ueberzug')
optdepends=(
		'lf: file manager that works with this script'
		'pandoc: text conversion'
		'perl-image-exiftool: image file metadata'
		'epub2txt: epub preview as text'
		'odt2txt: odt preview as text'
		'ffmpegthumbnailer: create thumbnails for videos for previews'
		'pdftoppm: pdf previews'
		'chafa: ascii previews'
		'fzf: fuzzy find with a previewer using fzfp'
		)
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')
install=info.install

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# build() {}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "$srcdir/$pkgname/stpv" "$pkgdir/usr/bin/stpv"
	install -Dm755 "$srcdir/$pkgname/stpvimg" "$pkgdir/usr/bin/stpvimg"
	install -Dm755 "$srcdir/$pkgname/stpvimgclr" "$pkgdir/usr/bin/stpvimgclr"
	install -Dm755 "$srcdir/$pkgname/fzfp" "$pkgdir/usr/bin/fzfp"

}
