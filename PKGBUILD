# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.3
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
makedepends=(sdcc)
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('60ed3bc41ec29217436f0aeff6058ad565f0e04ff00fac61f7be5c9f3dbfcfe1b0f09ef4168e67a58b2e93ff575f895afe79110e70245db020281f8efa25e0b4')

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
