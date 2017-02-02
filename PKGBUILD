# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=latex-beamer
pkgver=3.41
pkgrel=1
pkgdesc='Beamer is a LaTeX class for creating slides for presentations.'
arch=('any')
url='http://bitbucket.org/rivanvx/beamer/wiki/Home'
license=('GPL')
install='latex-beamer.install'
depends=('texlive-core')
source=("https://github.com/josephwright/beamer/archive/v${pkgver}.tar.gz")
sha256sums=('e6e989e34347c15de875ddb1dc2423b1608777eb85f88118551229deb38789c8')


package() {
  cd "${srcdir}/beamer-${pkgver}"

  find . -name "*.sty" | xargs sed -i -e '/\ProvidesPackageRCS \$Header\$/ s/^/%/'
  mkdir -p -- "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
  cp -r -- * "${pkgdir}/usr/share/texmf-dist/tex/latex/beamer"
}

