# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.4
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
makedepends=(sdcc)
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('19b2b75d2e08804b15ba8f5cae5eca854f1b56a7b1c30b01b0c6611ff6b1fd5a80c2b90d686fd37a1d0c677974070ef61b2fb131b8094d36c38578a4a4ddbcfd')

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
