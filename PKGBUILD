pkgbase=aarch64-ppp-elf-gcc
pkgname=($pkgbase)
pkgver=10.3.0
_majorver=${pkgver%%.*}
pkgrel=1
pkgdesc='ARM64 GCC Toolchain (10.3.0) for the PinePhone Pro'
arch=(aarch64)
url="https://crosstool-ng.github.io"
license=(GPL LGPL FDL custom)
makedepends=(crosstool-ng)
options=(!emptydirs)
source=("https://gist.githubusercontent.com/wasertech/776d77c39e61ef89afca9a4e410accf1/raw/08729870349a42e5bb7cd89032bb46d2a14d5168/.config")
sha256sums=('SKIP')

prepare() {
  ct-ng --version
  unset CFLAGS
  unset CXXFLAGS
}

build() {
  ct-ng build
}

package_aarch64-ppp-elf-gcc() {
  mkdir -p "$pkgdir"/usr/bin
  mv -f ~/x-tools/aarch64-ppp-elf "$pkgdir"/usr/bin/
}
