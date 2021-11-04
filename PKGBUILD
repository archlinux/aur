# Maintainer Augusto Modanese <modanese@kit.edu>

pkgname=latex-template-lipics
pkgver=2021.1.2
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
  '7eb0d0b526e0da34149d10178a74eb73bf0d25c20410b08a8bbe24472a4926dc'
)
makedepends=('tar')
depends=('texlive-latex3')
install=texlive.install

package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/lipics
  cd ${srcdir}/authors
  for _LIPICS in CHANGELOG.md LICENSE.md cc-by.pdf lipics-logo-bw.pdf lipics-v${pkgmajver}.cls lipics-v${pkgmajver}-authors-guidelines.pdf orcid.pdf; do
    install -m 0644 -D ${_LIPICS} ${pkgdir}/usr/share/texmf-dist/tex/latex/lipics/${_LIPICS}
  done
}
