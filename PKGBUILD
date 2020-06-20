# Maintainer: Peter Hoeg <first name at last name dot com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

_name=cleanthesis
pkgname=texlive-${_name}
pkgver=0.4.1
pkgrel=1
pkgdesc="A beautiful clean LaTeX style"
arch=("any")
url="http://cleanthesis.der-ric.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("${_name}-${pkgver}.tar.gz::https://github.com/derric/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('9c669bdce79bcb2442cbf7b4d99b93ce2750a85dbb5f8e1610e2b3e0e7f887b9')
install=texlive.install

package() {
  cd "$srcdir/${_name}-${pkgver}"

  install -m775 -d "$pkgdir/usr/share/texmf/doc/latex/${_name}"
  install -m775 -d "$pkgdir/usr/share/texmf/tex/latex/${_name}"
  cp -R README.md doc/cleanthesis-doc.pdf "$pkgdir/usr/share/texmf/doc/latex/${_name}/"
  cp -R *.sty "$pkgdir/usr/share/texmf/tex/latex/${_name}/"
}
