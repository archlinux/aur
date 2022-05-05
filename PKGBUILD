# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=nidaqmx-source-support-dummy
pkgver=0.1
pkgrel=2
pkgdesc="Dummy library to compile and link code using NI DAQmx under Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://aur.archlinux.org/pkgbase/nidaqmx-source-support-dummy"
license=('GPL3')
depends=('glibc')
makedepends=()
changelog=ChangeLog
source=("NSSDfile://nidaqmx-source-support-dummy-0.1.tar.gz")
sha512sums=('SKIP')

DLAGENTS+=('NSSDfile::/usr/bin/echo "Please read the Pinned Commment of 2020-06-10 at https://aur.archlinux.org/packages/nidaqmx-source-support-dummy and send me an email (https://aur.archlinux.org/account/AstroFloyd) if you want to try this package.  I can then send you the tarball and you can put it next to the PKGBUILD to compile and install it.)"')

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
  # cp -v libNIDAQmx.a ${pkgdir}/usr/lib/
}
