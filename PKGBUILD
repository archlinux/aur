# Maintainer Augusto Modanese <modanese@kit.edu>

pkgname=latex-template-lipics
veryear=2019
pkgver=${veryear}.1
pkgrel=1
pkgdesc="LaTeX template for LIPIcs (Leibniz International Proceedings in Informatics)"
url="https://www.dagstuhl.de/en/publications/lipics"
license=('CCPL:by')
source=(
  "https://submission.dagstuhl.de/styles/download-tag/lipics/v${pkgver}/authors/tgz"
)
arch=('any')
sha256sums=(
  '1ef4c8ad966460dad3deb72269b97b721972033e63c220bd637d760080a07f06'
)
makedepends=('tar')
depends=('texlive-latex3')
install=texlive.install

package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/lipics
  cd ${srcdir}/authors
  for _LIPICS in CHANGELOG.md LICENSE.md cc-by.pdf lipics-logo-bw.pdf lipics-v${veryear}.cls lipics-v${veryear}-authors-guidelines.pdf orcid.pdf; do
    install -m 0644 -D ${_LIPICS} ${pkgdir}/usr/share/texmf-dist/tex/latex/lipics/${_LIPICS}
  done
}
