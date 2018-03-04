# Maintainer: Narendiran A <a.narendiran@gmail.com>

pkgname=mnsymbol
pkgver=1.4
pkgrel=1
pkgdesc="MnSym­bol is a sym­bol font fam­ily, de­signed to be used in con­junc­tion with Adobe Min­ion Pro and similar fonts"
arch=('any')
url="https://www.ctan.org/tex-archive/fonts/mnsymbol/"
license=('pd')
makedepends=('texlive-latexextra')
source=("http://mirrors.ctan.org/fonts/mnsymbol.zip")
md5sums=('SKIP')

build() {
        cd "$srcdir/$pkgname/tex"
        xelatex MnSymbol.ins
}

package() {
        install -Dm644 $srcdir/$pkgname/tex/MnSymbol.sty "$pkgdir"/usr/share/texmf/tex/latex/MnSymbol/MnSymbol.sty
        install -d "$pkgdir"/usr/share/texmf/fonts/source/public/MnSymbol
        cp -a $srcdir/$pkgname/source/* "$pkgdir"/usr/share/texmf/fonts/source/public/MnSymbol/
}

post_install() {
		mktexlsr
}

post_upgrade() {
		mktexlsr
}