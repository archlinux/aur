# Maintainer: Gustavo Castro < gustawho _at_ disroot _dot_ org >
# Previous Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=latex-beamer
pkgver=3.55
pkgrel=1
pkgdesc='Beamer is a LaTeX class for creating slides for presentations.'
arch=('any')
url='https://github.com/josephwright/beamer'
license=('GPL2')
install='latex-beamer.install'
depends=('texlive-core')
source=("${pkgname}-${pkgver}::https://github.com/josephwright/beamer/archive/v${pkgver}.tar.gz")
sha256sums=('506228c911995944c2280fe455cacb045e32a674022731c5468d90011f3ae52f')


package() {
  cd "${srcdir}/beamer-${pkgver}"
  find . -name "*.sty" | xargs sed -i -e '/\ProvidesPackageRCS \$Header\$/ s/^/%/'
  mkdir -p -- "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
  cp -r -- * "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
}
