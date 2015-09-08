# Maintainer: Peter Hoeg <first name at last name dot com>

_name=cleanthesis
pkgname=texlive-${_name}
pkgver=0.3.1
pkgrel=1
pkgdesc="A beautiful clean LaTeX style"
arch=("any")
url="http://cleanthesis.der-ric.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra' 'koma-script')
source=("${_name}-${pkgver}-${pkgrel}.tar.gz::https://github.com/derric/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('386000ab2e603d8865df0ac5d93406a9bdeaefa9328bf90ece0a16f1d76b3b93')
install=texlive.install

package() {
  cd "$srcdir/${_name}-${pkgver}"

  install -m775 -d "$pkgdir/usr/share/texmf/doc/latex/${_name}"
  install -m775 -d "$pkgdir/usr/share/texmf/tex/latex/${_name}"
  # cp -R README.md                 "$pkgdir/usr/share/texmf/doc/latex/${_name}/"
  cp -R README.md *.bib *.tex content "$pkgdir/usr/share/texmf/doc/latex/${_name}/"
  cp -R *.sty "$pkgdir/usr/share/texmf/tex/latex/${_name}/"
}
