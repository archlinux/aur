# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.2
pkgrel=2
pkgdesc="An open-source firmware for Cypress FX2"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
builddepends=(sdcc)
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b1f90e06227dcd3832bb61267ef8d20a7b4df702228b884c13725e472ed56bd971a46e2b4104bde666abc599edbe20cdbb51e30ee423b07c27ab1093de5953df')

build(){
  cd $srcdir/$pkgname-$pkgver
  ./configure
  make
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  mkdir $pkgdir/usr/share
  ln -s /usr/local/share/sigrok-firmware $pkgdir/usr/share/sigrok-firmware
}

