# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matheus Magalhães de Alcantara <matheus.de.alcantara@gmail.com>
pkgname=amuletml-bin
provides=('amuletml')
conflicts=('amuletml')
pkgver=0.4.0.0
pkgrel=1
pkgdesc="The Amulet programming language"
arch=(x86_64)
url="https://hydraz.semi.works/amulet/"
license=('BSD')
source=("https://hydraz.semi.works/amulet/install-amulet.sh")
noextract=()
md5sums=('73b8390cf7974c38dcfd850d7810f0c4')
validpgpkeys=()

package() {
  env PREFIX=$pkgdir/usr/ bash install-amulet.sh
  sed -re "s;exec $pkgdir/;exec /;g" -i $pkgdir/usr/bin/amc
  sed -re "s;exec $pkgdir/;exec /;g" -i $pkgdir/usr/bin/amc-prove
}
