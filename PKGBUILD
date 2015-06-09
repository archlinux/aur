# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=eep24c
pkgver=0.1.2
pkgrel=1
pkgdesc="Read and write serial I2C eeprom devices"
arch=('i686' 'x86_64')
url="http://eep24c.sourcearchive.com/"
license=('GPL')
depends=('glibc')
backup=('etc/eep24c/eep24c.cfg')
source=("http://eep24c.sourcearchive.com/downloads/0.1.2-5/eep24c_0.1.2.orig.tar.gz"
        'eep24c_0.1.2-5.patch')
md5sums=('b8427a22469116ddb0041cb283ceb11a'
         '9d2ab3026a7c22574fcf17bcd5a571aa')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/eep24c_0.1.2-5.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make CFLAGS="${CFLAGS}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
