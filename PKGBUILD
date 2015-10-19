# Mantainer: MCMic <come@chilliet.eu>

pkgname=anticube2-git
pkgver=5c8fe63
pkgrel=1
pkgdesc="Interactive non-linear puzzle game based on Tesseract"
arch=('i686' 'x86_64')
url="http://quadropolis.us/node/4182"
license=('CC-BY')
depends=(tesseract-game)
makedepends=('git')
source=("git://github.com/Kvaleya/Anticube2.git")
md5sums=(SKIP)
_gitname='Anticube2'

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

package() {
  cd ${srcdir}/${_gitname}
  mkdir -p ${pkgdir}/usr/share/tesseract-game/
  mkdir -p ${pkgdir}/usr/bin/
  cp -r media ${pkgdir}/usr/share/tesseract-game/
  echo -e "#!/bin/sh\ntesseract-game -x\"hudgun 0; ao 0\" -lac2" > ${pkgdir}/usr/bin/anticube2 
  chmod +x ${pkgdir}/usr/bin/anticube2 
}
