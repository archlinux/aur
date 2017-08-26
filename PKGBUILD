# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=pps-tools
pkgdesc="LinuxPPS user-space tools"
pkgver=1.0
pkgrel=3
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="http://linuxpps.org/"
license=('GPL2')
conflicts=('pps-tools-git')
source=("https://github.com/ago/pps-tools/archive/v$pkgver.tar.gz")
sha512sums=('fd63f3121bbd850bf0b8d84b57e0c14f4ce26fe710c749cc4237684a1bb46fdfa49beeddb26cb98bd81f24cc1d6f8969dc54c6ed339ca2eed43d5a0884b19276')

build() {
  cd ${pkgname}-${pkgver}
  LDLIBS=-lm make
}

package() {
  cd ${pkgname}-${pkgver}

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/include/sys"

  LDLIBS=-lm make DESTDIR="$pkgdir/" install
}
