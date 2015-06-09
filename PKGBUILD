# Maintainer: Giovanni Scafora <giovanni@archlinux.org> 

pkgname=rfdump
pkgver=1.6
pkgrel=2
pkgdesc="Tool to detect RFID-Tags and show their meta information"
arch=('i686' 'x86_64')
url="http://www.rfdump.org"
license=('GPL')
depends=('libglade')
source=("http://www.rfdump.org/dl/${pkgname}-${pkgver}.tar.bz2")
md5sums=('e355566826ae313eb51aeb0d54ba1b68')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  export LDFLAGS="-lexpat"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
