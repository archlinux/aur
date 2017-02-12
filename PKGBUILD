# Maintainer: revelation60 <https://aur.archlinux.org/account/revelation60>

pkgname=texlive-axodraw2
pkgver=2.1.0b
pkgrel=1
license=('GPL')
makedepends=('gcc')
depends=('texlive-core' 'texlive-latexextra')
pkgdesc='A LaTeX package for drawing Feynman graphs'
url='https://www.ctan.org/pkg/axodraw2'
arch=('any')
install=texlive-axodraw2.install
source=('http://mirrors.ctan.org/graphics/axodraw2/axodraw2.sty'
		'http://mirrors.ctan.org/graphics/axodraw2/axohelp.c')
sha256sums=('f71dc57d3a5c0c3c7f8e4412c7fb7bb499a48fda643d44d6793178cb3eaa7b4b'
            'a46a733b3fa1ada6bc58bcdbce3348d0cb12ff4664f09ade042d98fc01189f0b')

build() {
	gcc -lm -o axohelp $srcdir/axohelp.c
}

package() {
	mkdir -p $pkgdir/usr/share/texmf/tex/latex/axodraw2
	cp $srcdir/axodraw2.sty $pkgdir/usr/share/texmf/tex/latex/axodraw2

	mkdir -p $pkgdir/usr/bin/
	install $srcdir/axohelp $pkgdir/usr/bin
}
