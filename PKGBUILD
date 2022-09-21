# Maintainer: Étienne Deparis <etienne@depar.is>
# Creator: TheMagicBanana

pkgname=fortune-mod-kaamelott
pkgver=4
pkgrel=2
url='https://fr.wikiquote.org/wiki/Kaamelott'
pkgdesc="Quotes from the French comedy show Kaamelott."
license=('CCPL')
arch=('any')
depends=('fortune-mod')
makedepends=('coreutils')
source=("kaamelott")
sha1sums=('33fb3d45b8ee9dbc483647bff19f2cddcd443daa')

build() {
  fold -w 80 -s kaamelott > kaamelott.folded || exit 1
  strfile -r kaamelott.folded kaamelott.dat || exit 2
}

package(){
  install -d "$pkgdir/usr/share/fortune/fr"
  install -m644 "$srcdir/kaamelott.folded" "$pkgdir/usr/share/fortune/fr/kaamelott"
  install -m644 "$srcdir/kaamelott.dat" "$pkgdir/usr/share/fortune/fr/kaamelott.dat"
}
