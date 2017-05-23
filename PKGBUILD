# Maintainer: ABDULLATIF Mouhamadi <bourou01dev@gmail.com>

pkgname=avr-libc-tinyos
pkgver=1.6.7
pkgrel=1
pkgdesc="The C runtime library for the AVR family of microcontrollers, with TinyOS patches"
arch=('any')
url="http://savannah.nongnu.org/projects/avr-libc/"
license=('custom')
depends=('gcc-avr-tinyos')
provides=('avr-libc')
options=('staticlibs' '!strip') 
source=("http://download.savannah.gnu.org/releases/avr-libc/old-releases/avr-libc-${pkgver}.tar.bz2")
md5sums=('1ccf8078e583d527392f079082f816b0')

build() {
  cd ${srcdir}/avr-libc-${pkgver}
  ./configure --build=$(./config.guess) --host=avr --prefix=/usr
  make
}

package() {
  cd ${srcdir}/avr-libc-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
