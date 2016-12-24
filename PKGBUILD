# Maintainer: Stefano Angeleri <weltall2 AT gmail DOT com>
# Contributor: Boris Shomodjvarac <spam AT shomodj DOT com>
pkgname=vmtouch
pkgver=1.2.0
pkgrel=1
pkgdesc="Portable file system cache diagnostics and control"
arch=('any')
url="https://github.com/hoytech/vmtouch"
license=('BSD')
source=("https://github.com/hoytech/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('09dad8440bad936e8b8accedd7a6b317')
depends=('glibc')
makedepends=('perl')

build() {
  cd "vmtouch-$pkgver"
  gcc -Wall -O3 -o vmtouch vmtouch.c
  pod2man --section 8 vmtouch.pod > vmtouch.8
}

package() {
  cd "vmtouch-$pkgver"
  install -Dm755 vmtouch   $pkgdir/usr/bin/vmtouch
  install -Dm644 vmtouch.8 $pkgdir/usr/share/man/man8/vmtouch.8  
}

# vim:set ts=2 sw=2 et:
