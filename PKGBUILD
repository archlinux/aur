# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.6
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
conflicts=("sigrok-firmware-fx2lafw-bin")
makedepends=(sdcc)
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d636e9a86009a4581630e38beaee144330bd3ea2e2f69487b09c3d8e372e722877f76dab05c8c5098c6fabd041eab04c3169a0d2f8fbed8a6f5de8c3e6f5841d')


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
