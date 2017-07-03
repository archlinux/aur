# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.5
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
makedepends=(sdcc)
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('56db016987fd05131762b958e8dea705315aa44604ba63c2dffafdee0df33fbfa5a167c3a8ee7568ffd0fb0cd90df01c72627203ea8427f5e849c55a00e54478')


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
