# Maintainer: gaogaoqwq <gaogaoqwq@gmail.com>
pkgname=loongarch64-linux-gnu-gcc-libc
pkgver=14.2.0
_pkgdate=2025.02.21
_pkgfilename="x86_64-cross-tools-loongarch64-binutils_2.44-gcc_14.2.0-glibc_2.41.tar.xz"
_target="loongarch64-unknown-linux-gnu"
pkgrel=5
pkgdesc="Build tools for Loongson (Binary)."
arch=('x86_64')
url="https://github.com/loongson/build-tools"
license=(GPL LGPL FDL)
makedepends=('coreutils' 'pacman' 'tar' 'xz')
conflicts=('loongarch64-linux-gnu-gcc')
source=("https://github.com/loongson/build-tools/releases/download/${_pkgdate}/${_pkgfilename}")
sha256sums=('b6b058ab77cf21c806db409d1fb2ad4b43fa23832616216099cf8168274f16b6')
options=(!debug !strip staticlibs)

package() {
  install -Ddm755 "$pkgdir"/usr/"$_target"
  cp -r "$srcdir"/cross-tools/* "$pkgdir"/usr
  rm -r "$pkgdir"/usr/include/gdb
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/locale
  rm -r "$pkgdir"/usr/share/man/man7
}
