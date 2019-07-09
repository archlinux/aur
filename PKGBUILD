# Maintainer Augusto Modanese <modanese@kit.edu>

pkgname=latex-template-lipics
pkgver=2019
pkgrel=1
pkgdesc="LaTeX template for LIPIcs (Leibniz International Proceedings in Informatics)"
url="https://www.dagstuhl.de/en/publications/lipics"
license=('CCPL:by')
source=(
  "http://drops.dagstuhl.de/styles/lipics-v${pkgver}/lipics-v${pkgver}-authors.zip"
)
arch=('any')
sha256sums=(
  'd95c8de2b8525db7375fd8263aafd2aa04a1aa87016ee2a6c75e0ca0a158bfc9'
)
makedepends=('unzip')
depends=('texlive-latex3')
install=texlive.install

package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/lipics
  cd ${srcdir}/lipics-v${pkgver}-authors
  for _LIPICS in CHANGELOG cc-by.pdf lipics-logo-bw.pdf lipics-v${pkgver}.cls lipics-v${pkgver}-authors-guidelines.pdf orcid.pdf; do
    install -m 0644 -D ${_LIPICS} ${pkgdir}/usr/share/texmf-dist/tex/latex/lipics/${_LIPICS}
  done
}
