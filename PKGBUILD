# Maintainer: Davide Peressoni <davide dot peressoni at outlook dot com>

pkgname=latex-padova-dei
pkgver=1.0
pkgrel=1
pkgdesc="Beamer theme for the Department of Information Engineering at the University of Padua"
arch=(any)
url="https://github.com/electricant/beamerThemePadovaDEI"
depends=('texlive-core')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
install="${pkgname}.install"
source=('git://github.com/electricant/beamerThemePadovaDEI.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/beamerThemePadovaDEI
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/beamerThemePadovaDEI
  mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/padova-dei

  install -m644 *.sty *.pdf \
          "$pkgdir/usr/share/texmf-dist/tex/latex/padova-dei/"
}
