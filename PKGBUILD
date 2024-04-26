# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=3.37
pkgrel=2
pkgdesc='TUDa-CI for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://github.com/tudace/tuda_latex_templates'
license=('custom')
depends=('latex-tuda-ci-logos')
makedepends=(
  'biber'
  'texlive-basic'
  'texlive-bibtexextra'
  'texlive-bin'
  'texlive-fontsextra'
  'texlive-langcyrillic'
  'texlive-langgerman'
  'texlive-latexextra'
  'texlive-luatex'
  'texlive-pictures'
  'texlive-publishers'
  'zip'
)
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/${_pkgname}/archive/v${pkgver}/${pkgver}-${_pkgname}.tar.gz")
b2sums=('b74dbfc1082296dffc1af5d161777f889281ceda1859fe2341c1aaea5bbdb5183cb635f6408995c2e9c9596d33a9d8d9844fa20fa38b7c87c0df5d09886619aa')

build() {
  cd ${_pkgname}-${pkgver}
  # currently broken
  # l3build doc
}

package() {
  cd ${_pkgname}-${pkgver}
  l3build install --texmfhome ${pkgdir}/usr/share/texmf
  install -Dm644 LICENSE_info "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
