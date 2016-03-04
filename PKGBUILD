# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=fortune-tontons-flingueurs-fr
pkgver=20160304
pkgrel=1
pkgdesc="Fortune cookies from french movie Les Tontons Flingeurs"
arch=('any')
url="http://fr.wikiquote.org/wiki/Les_Tontons_flingueurs"
license=('unknown')
depends=('fortune-mod')
makedepends=('coreutils')
source=(tontonsflingueurs)
sha1sums=('2f8fe0fe837aa22e010989fe27e0801288965203')

build() {
  cd ${srcdir}
  fold -w 80 -s tontonsflingueurs > tontonsflingueurs.folded || exit 1
  strfile -r tontonsflingueurs.folded tontonsflingueurs.dat || exit 2
}

package() {
  install -d ${pkgdir}/usr/share/fortune/fr
  install -m644 ${srcdir}/tontonsflingueurs.folded ${pkgdir}/usr/share/fortune/fr/tontonsflingueurs
  install -m644 ${srcdir}/tontonsflingueurs.dat ${pkgdir}/usr/share/fortune/fr/tontonsflingueurs.dat
}
