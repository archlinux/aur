# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=flipit-x10
pkgver=0.3.6
pkgrel=1
pkgdesc="Flipit is a utility to allow the use of the X10 FireCracker wireless appliance control kit"
url="http://www.lickey.com/flipit"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
source=("http://www.lickey.com/flipit/dist/flipit-${pkgver}.tar.gz")
sha256sums=('d996fa31d049f05c4fe163152192a60dce9b9d7c4711c948d08deaf5c61ae354')

build() {
  cd "${srcdir}/flipit-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/flipit-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
