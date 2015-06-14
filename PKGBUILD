# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: J. Kuske <kuskej@yahoo.com>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=invaders
pkgver=1.0.0
pkgrel=3
pkgdesc="Multi boot compliant kernel game"
arch=('i686')
url="http://www.erikyyy.de/invaders"
license=('GPL2')
install=$pkgname.install
source=($url/$pkgname-$pkgver.tar.gz
        $pkgname.patch::http://www.coreboot.org/pipermail/coreboot/attachments/20090413/4bd0af62/attachment.ksh)
md5sums=('c5efef690f8c7f3c667cabb696528ab9'
         '1ac4007705393aa30a7b81403f81e431')

prepare() {
  cd $pkgname
  patch -Np1 -i ../$pkgname.patch
}

build() {
  cd $pkgname
  ./compile.sh
}

package() {
  install -Dm644 $pkgname/$pkgname $pkgdir/boot/$pkgname
}