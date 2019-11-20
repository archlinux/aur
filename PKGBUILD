# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.7
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
conflicts=("sigrok-firmware-fx2lafw-bin")
makedepends=(sdcc)
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e9973980b07cef395637476c6294473e349770be24afe6b03d284bf3057f6b32fe686e25f3baa180b96455397db43e16f191a9feb07bf46e097170fb4d326f8e')


# Alternate approach: download prebuild firmware
#source=("http://sigrok.org/download/binary/${pkgname}/${pkgname}-bin-${pkgver}.tar.gz")

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  #mkdir -p ${pkgdir}/usr/local/share/
  #ln -s ${pkgdir}/usr/share/sigrok-firmware ${pkgdir}/usr/local/share/sigrok-firmware
  #ln -s /usr/local/share/sigrok-firmware $pkgdir/usr/share/sigrok-firmware
}
