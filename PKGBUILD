# Maintainer: Stefano Angeleri <weltall2 AT gmail DOT com>
# Contributor: Boris Shomodjvarac <spam AT shomodj DOT com>
pkgname=vmtouch
pkgver=1.0.1
pkgrel=2
pkgdesc="Portable file system cache diagnostics and control"
arch=('i686' 'x86_64')
url="https://github.com/hoytech/vmtouch"
license=('BSD')
source=("https://github.com/hoytech/vmtouch/tarball/$pkgname-$pkgver")
md5sums=('ee7abf6103882d349281f5e166d11f77')
depends=('glibc')
makedepends=('perl')

build() {
  cd "hoytech-vmtouch-ae0c045"
  gcc -Wall -O3 -o vmtouch vmtouch.c
  pod2man --section 8 vmtouch.pod > vmtouch.8
}

package() {
  cd "hoytech-vmtouch-ae0c045"

  install -Dm755 vmtouch   $pkgdir/usr/bin/vmtouch
  install -Dm644 vmtouch.8 $pkgdir/usr/share/man/man8/vmtouch.8  
}

# vim:set ts=2 sw=2 et:
