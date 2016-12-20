# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=tanidvr
pkgver=1.4.1
pkgrel=1
pkgdesc="Tool for DVRs and IP cameras based on the DVR-IP protocol"
arch=('i686' 'x86_64')
url="http://tanidvr.sourceforge.net/"
license=('GPL3')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/${pkgname}/TaniDVR/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('b0acaaa156560676d864d2826f5fcbf8')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
