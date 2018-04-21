# Maintainer: Darshit Shah <darnir [uses] gmail [on] com>

_name=oasics
pkgname=texlive-${_name}
pkgver=2018
pkgrel=1
pkgdesc="Latex formatting for OASICs Style"
arch=("any")
url="https://www.dagstuhl.de/en/publications/oasics/"
license=('CC-BY')
depends=('texlive-core' 'texlive-latexextra')
source=("http://drops.dagstuhl.de/styles/${_name}-v${pkgver}/${_name}-v${pkgver}-authors.tgz")
sha256sums=('20b9c65afd7e6ae099dcab911173892eff01f0584ec280d1507c2a8de72fae62')

package() {
  cd "$srcdir/${_name}-v${pkgver}-authors"

  install -m775 -d "$pkgdir/usr/share/texmf/doc/latex/${_name}"
  install -m775 -d "$pkgdir/usr/share/texmf/tex/latex/${_name}"
  cp -R oasics-v2018-sample-article.pdf oasics-v2018-sample-article.tex oasics-v2018-sample-article.bib "$pkgdir/usr/share/texmf/doc/latex/${_name}/"
  cp -R cc-by.pdf oasics-logo-bw.pdf ./*.cls orcid.pdf "$pkgdir/usr/share/texmf/tex/latex/${_name}/"
}
