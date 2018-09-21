# Maintainer: Gustavo Castro < gustawho _at_ disroot _dot_ org >
# Previous Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=latex-beamer
pkgver=3.54
pkgrel=1
pkgdesc='Beamer is a LaTeX class for creating slides for presentations.'
arch=('any')
url='https://github.com/josephwright/beamer'
license=('GPL2')
install='latex-beamer.install'
depends=('texlive-core')
source=("${pkgname}-${pkgver}::https://github.com/josephwright/beamer/archive/v${pkgver}.tar.gz")
sha256sums=('39949b28c6ed995ecbd1cd2e18b2b22f0197538f6b8e9740425115f17e99a091')


package() {
  cd "${srcdir}/beamer-${pkgver}"
  find . -name "*.sty" | xargs sed -i -e '/\ProvidesPackageRCS \$Header\$/ s/^/%/'
  mkdir -p -- "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
  cp -r -- * "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
}
