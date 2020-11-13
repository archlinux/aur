# Maintainer: Alexander Eisele <alexander@eiselecloud.de>

# Based on https://github.com/flosse/aur-texlive-pgfgantt

pkgname=texlive-pgfgantt
pkgver=5.0
pkgrel=1
license=('LPPL')
depends=('texlive-core')
pkgdesc='A LaTeX package that provides the ganttchart environment, which draws a Gantt chart within a TikZ picture.'
url='https://www.ctan.org/pkg/pgfgantt?lang=en'
arch=('any')
install=${pkgname}.install
source=('http://mirrors.ctan.org/graphics/pgf/contrib/pgfgantt.zip')
sha256sums=('94644bc77cfc38e7d6062794e79a08d30b1835e690d846fb429826fe25f37df3')

build() {
  cd "$srcdir/pgfgantt/"
  latex "pgfgantt.ins"
}
package() {
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/pgfgantt
  install -D -m644 $srcdir/pgfgantt/pgfgantt.sty $pkgdir/usr/share/texmf/tex/latex/pgfgantt/
}

