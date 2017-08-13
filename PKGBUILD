# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=latex-beamer
pkgver=3.42
pkgrel=1
pkgdesc='Beamer is a LaTeX class for creating slides for presentations.'
arch=('any')
url='https://github.com/josephwright/beamer'
license=('GPL')
install='latex-beamer.install'
depends=('texlive-core')
source=("https://github.com/josephwright/beamer/archive/v${pkgver}.tar.gz")
sha256sums=('6ac3708cd44638d2fb237c33e871cb1d2616d6e10597266bb1ea443341141bda')


package() {
  cd "${srcdir}/beamer-${pkgver}"

  find . -name "*.sty" | xargs sed -i -e '/\ProvidesPackageRCS \$Header\$/ s/^/%/'
  mkdir -p -- "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
  cp -r -- * "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
}

