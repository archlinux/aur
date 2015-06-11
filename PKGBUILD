# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=latex-beamer
pkgver=3_36
pkgrel=1
pkgdesc='Beamer is a LaTeX class for creating slides for presentations.'
arch=('any')
url='http://bitbucket.org/rivanvx/beamer/wiki/Home'
license=('GPL')
install='latex-beamer.install'
depends=('texlive-core')
source=("https://bitbucket.org/rivanvx/beamer/get/version-${pkgver//_/-}.tar.bz2")
sha256sums=('3a7ff9df09b65db9c65bd1d7b613540cf275adc5c2a7981dc27abd03e49bf735')


package() {
  cd rivanvx-beamer-*

  find . -name "*.sty" | xargs sed -i -e '/\ProvidesPackageRCS \$Header\$/ s/^/%/'
 
  install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer

  cp -r  * ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer
}

