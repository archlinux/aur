# Maintainer: Stefano Angeleri <weltall2 AT gmail DOT com>
# Contributor: Boris Shomodjvarac <spam AT shomodj DOT com>
pkgname=vmtouch
pkgver=0.8.0
pkgrel=1
pkgdesc="Portable file system cache diagnostics and control"
arch=('i686' 'x86_64')
url="https://github.com/hoytech/vmtouch"
license=('BSD')
source=("https://github.com/hoytech/vmtouch/tarball/$pkgname-$pkgver")
md5sums=('e0b874b5685538bbbb86251cbfead2e3')
depends=('glibc')

build() {
  cd "hoytech-vmtouch-a54935b"
  gcc -Wall -O3 -o vmtouch vmtouch.c
}

package() {
  cd "hoytech-vmtouch-a54935b"

  install -Dm755 vmtouch   $pkgdir/usr/bin/vmtouch
  install -Dm644 vmtouch.8 $pkgdir/usr/share/man/man8/vmtouch.8  
}

# vim:set ts=2 sw=2 et:
