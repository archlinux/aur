# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=nidaqmx-dummy
pkgver=0.1
pkgrel=1
pkgdesc="Dummy library to compile and link code using NI DAQmx under Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://doesnotexist.sourceforge.net/"
license=('GPL3')
depends=('glibc')
makedepends=()
changelog=ChangeLog
source=("http://doesnotexist.sourceforge.net/projects/doesnotexist/files/$pkgname-$pkgver.tar.gz")
sha512sums=('f8b29dc52e852035ac6c9c2f38f098f53f78444ddd3b38039ae206a9367198cbe72f95d44b94b86dd0c2fa88f4ad00bf453b050512e62688f629aba1c197a2b3')

prepare() {
  cp etc/Makefile .
}

build() {
  make
}

package() {
  mkdir -p ${pkgdir}/usr/include/ ${pkgdir}/usr/lib/
  cp -v src/NIDAQmx.h ${pkgdir}/usr/include/
  cp -v libNIDAQmx.so ${pkgdir}/usr/lib/
  #cp -v libNIDAQmx.a ${pkgdir}/usr/lib/
}
