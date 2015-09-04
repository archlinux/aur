# Maintainer: Peter Hoeg <peter@hoeg.com>

_name=cleanthesis
pkgname=texlive-${_name}
pkgver=0.3.1
pkgrel=1
pkgdesc="A beautiful clean LaTeX style"
arch=("any")
url="http://cleanthesis.der-ric.de/"
license=('GPL3')
depends=('texlive-latexextra' 'koma-script')
install=${_name}.install
makedepends=('unzip')
source=("https://github.com/derric/${_name}/archive/v${pkgver}.zip")
sha1sums=('50a374c236e0b7d8f3e7e0bd43d037d10c5b7164')

package() {
  install -m775 -d "$pkgdir/usr/share/texmf-dist/doc/latex/${_name}"
  install -m775 -d "$pkgdir/usr/share/texmf-dist/tex/latex/${_name}"
  cd "$srcdir/${_name}-${pkgver}"
  cp -R README.md                 "$pkgdir/usr/share/texmf-dist/doc/latex/${_name}/"
  cp -R *.bib *.sty *.tex content "$pkgdir/usr/share/texmf-dist/tex/latex/${_name}/"
}
