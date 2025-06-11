# Maintainer: gaogaoqwq <gaogaoqwq@gmail.com>
pkgname=loongarch64-linux-gnu-gcc-libc
pkgver=14.2.0
_pkgdate=2025.06.06
_pkgfilename="x86_64-cross-tools-loongarch64-binutils_2.44-gcc_15.1.0-glibc_2.41.tar.xz"
_target="loongarch64-unknown-linux-gnu"
pkgrel=2
pkgdesc="Build tools for Loongson (Binary)."
arch=('x86_64')
url="https://github.com/loongson/build-tools"
license=(GPL LGPL FDL)
makedepends=('coreutils' 'pacman' 'tar' 'xz')
conflicts=('loongarch64-linux-gnu-gcc')
source=("https://github.com/loongson/build-tools/releases/download/${_pkgdate}/${_pkgfilename}")
sha256sums=('e2e329dceb8376ebb23b051ff0404c4bf5d4b21709b36397ff3a9305689fb9ac')
options=(!debug !strip staticlibs)

package() {
  install -Ddm755 "$pkgdir"/usr/"$_target"
  cp -r "$srcdir"/cross-tools/* "$pkgdir"/usr
  rm -r "$pkgdir"/usr/lib64
  rm -r "$pkgdir"/usr/include/gdb
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/locale
  rm -r "$pkgdir"/usr/share/man/man7
}
