# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=fortune-mod-tontons-flingueurs-fr
pkgver=20160304
pkgrel=2
pkgdesc="Fortune cookies from french movie Les Tontons Flingeurs"
arch=('any')
url="https://fr.wikiquote.org/wiki/Les_Tontons_flingueurs"
license=('unknown')
depends=('fortune-mod')
makedepends=('coreutils')
source=(tontonsflingueurs)
sha256sums=('bf60621f97a576a44a38d963f1295dfdc6e44ce7cb7c4770f1600c7884ed6240')

build() {
  fold -w 80 -s tontonsflingueurs > tontonsflingueurs.folded || exit 1
  strfile -r tontonsflingueurs.folded tontonsflingueurs.dat || exit 2
}

package() {
  install -d "$pkgdir/usr/share/fortune/fr"
  install -m644 "$srcdir/tontonsflingueurs.folded" "$pkgdir/usr/share/fortune/fr/tontonsflingueurs"
  install -m644 "$srcdir/tontonsflingueurs.dat" "$pkgdir/usr/share/fortune/fr/tontonsflingueurs.dat"
}
