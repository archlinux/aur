# Maintainer Augusto Modanese <augusto.modanese@aalto.fi>

pkgname=latex-template-lipics
pkgver=2021.1.3
pkgmajver=$(cut -d'.' -f1 <<<"${pkgver}")
pkgrel=1
pkgdesc="LaTeX template for LIPIcs (Leibniz International Proceedings in Informatics)"
url="https://www.dagstuhl.de/en/publications/lipics"
license=('CCPL:by')
source=(
  "https://submission.dagstuhl.de/styles/download-tag/lipics/v${pkgver}/authors/tgz"
)
arch=('any')
sha256sums=(
  'SKIP'
)
makedepends=('tar')
depends=('texlive-core')
install=texlive.install

package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/lipics
  cd ${srcdir}/lipics-authors-v${pkgver}
  for _LIPICS in CHANGELOG.md LICENSE.md cc-by.pdf lipics-logo-bw.pdf lipics-v${pkgmajver}.cls lipics-v${pkgmajver}-authors-guidelines.pdf orcid.pdf; do
    install -m 0644 -D ${_LIPICS} ${pkgdir}/usr/share/texmf-dist/tex/latex/lipics/${_LIPICS}
  done
}
