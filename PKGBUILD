# Maintainer: JustKidding <jk@vin.ovh>

pkgname=libgss
pkgver=1.0.3
pkgrel=2
pkgdesc="GNU Generic Security Service"
arch=('x86_64')
url="https://www.gnu.org/software/gss/"
license=('GPL3')
depends=('glibc')
source=(https://ftp.gnu.org/gnu/gss/gss-1.0.3.tar.gz)
sha256sums=('ff919ddc731531d65e27d7ababdc361aae05ada5f1a6dd60703d153307dcdeeb')

build(){
  cd gss-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check(){
  cd gss-$pkgver
  make -k check
}

package() {
  cd gss-$pkgver
  make DESTDIR="${pkgdir}" install
}
