# Maintainer: Varagnac Kim <vacaniat@pm.me>
pkgname=mediawiki2latex-bin
pkgver=7.39
pkgrel=1
pkgdesc="Mediawiki2latex, arch specific pre-built binary"
arch=('x86_64')
url="https://sourceforge.net/projects/wb2pdf/"
license=('GPL')
depends=('poppler' 'texlive-core' 'zlib')
optdepends=(
 'texlive-langextra: Language support for African, Arabic, Armenian, Croatian, Hebrew, Indic, Mongolian, Tibetan and Vietnamese'
 'texlive-langkorean: Language support for Korean'
 'texlive-langchinese: Language support for Chinese'
 'texlive-langjapanese: Language support for Japanese'
 'texlive-langgreek: Language support for Greek'
 'texlive-langcyrillic: Language support for Cyrillic'
	    )
source=("${pkgname}-${pkgver}-${pkgrel}::https://github.com/varagnac/prebuilt-packages/raw/master/mediawiki2latex-bin-7.39-1.tar.gz")
md5sums=('6ebc7f9f2d7fb9d4c98bdda6463471b5')

package() {
	cd "$srcdir/"
	install -Dm755 mediawiki2latex $pkgdir/usr/bin/mediawiki2latex
	install -Dm644 mediawiki2latex.1.gz $pkgdir/usr/share/man/man1/mediawiki2latex.1.gz
	install -dm755 $pkgdir/usr/share/mediawiki2latex/latex
	install -m644 latex/* $pkgdir/usr/share/mediawiki2latex/latex
}
