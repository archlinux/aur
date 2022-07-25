# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=serveez
pkgver=0.3.1
pkgrel=1
pkgdesc="server framework"
url="https://www.gnu.org/software/serveez"
arch=('x86_64')
license=("GPL3")
depends=("guile")
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/serveez/${pkgname}-${pkgver}.tar.lz")
md5sums=('02697fe81ff23365d956525ee0b6fd22')

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="${CFLAGS} -Wno-error=format-security"
  ./configure --prefix "${pkgdir}/usr"
  make
 
}

package() {
  cd "$pkgname-$pkgver"

  make install

}
