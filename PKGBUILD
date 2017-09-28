# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=pps-tools
pkgdesc="LinuxPPS user-space tools"
pkgver=1.0.1
pkgrel=1
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="http://linuxpps.org/"
license=('GPL2')
conflicts=('pps-tools-git')
source=("https://github.com/ago/pps-tools/archive/v$pkgver.tar.gz")
sha512sums=('6fe7eba2a1a073a64d40bcc7aef12981414b43656f05fbd84e3ffadf1a074c5aa8d032b39a37095e6846194558b685092b51799fe724fe50cce8f3cbe163f784')

build() {
  cd ${pkgname}-${pkgver}
  LDLIBS=-lm make
}

package() {
  cd ${pkgname}-${pkgver}

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/include/sys"

  LDLIBS=-lm make DESTDIR="$pkgdir/" install
}
