# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=rtl_biast-git
pkgver=0.5
pkgrel=1
pkgdesc="Bias tee software for the RTL-SDR.com V3 Dongle"
arch=('i686' 'x86_64')
license=('gpl')
url="https://github.com/rtlsdrblog/rtl_biast"
depends=('rtl-sdr' 'libusb')
makedepends=('git' 'cmake' 'gcc')
source=("git+https://github.com/rtlsdrblog/rtl_biast.git")
sha1sums=('SKIP')

build() {
  cd ${srcdir}/rtl_biast

  mkdir build
  cd build
  
  cmake ..
  make
}

package() {
  cd ${srcdir}/rtl_biast/build/src

  install -Dm755 rtl_biast ${pkgdir}/usr/bin/rtl_biast
}
