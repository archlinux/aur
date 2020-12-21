# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=pps-tools
pkgdesc="LinuxPPS user-space tools"
pkgver=1.0.2
pkgrel=1
arch=(aarch64 armv6h armv7h i686 x86_64)
url="http://linuxpps.org/"
license=('GPL2')
conflicts=('pps-tools-git')
source=("https://github.com/ago/pps-tools/archive/v$pkgver.tar.gz")
b2sums=('bc60a9ea94bb57bcc2b7870da433ef04fbbc30e5c4d880b719a8e7fcabba0bef2996c086e6993b879f2515cd0c685659bfed5371904401e35120ae1e9dc0891a')

build() {
  cd ${pkgname}-${pkgver}
  LDLIBS=-lm make
}

package() {
  cd ${pkgname}-${pkgver}

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/include/sys"

  LDLIBS=-lm make DESTDIR="$pkgdir/" install
}
