# Maintainer: Gustavo Castro < gustawho _at_ disroot _dot_ org >
# Previous Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=latex-beamer
pkgver=3.53
pkgrel=1
pkgdesc='Beamer is a LaTeX class for creating slides for presentations.'
arch=('any')
url='https://github.com/josephwright/beamer'
license=('GPL2')
install='latex-beamer.install'
depends=('texlive-core')
source=("${pkgname}-${pkgver}::https://github.com/josephwright/beamer/archive/v${pkgver}.tar.gz")
sha256sums=('4647112e54c405a07d1eb0dc2b69a3ae27dc2ea2d7e42c81bc215a523ec25302')


package() {
  cd "${srcdir}/beamer-${pkgver}"
  find . -name "*.sty" | xargs sed -i -e '/\ProvidesPackageRCS \$Header\$/ s/^/%/'
  mkdir -p -- "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
  cp -r -- * "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
}
