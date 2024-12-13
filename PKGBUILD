# Maintainer: gaogaoqwq <gaogaoqwq@gmail.com>
pkgname=loongarch64-linux-gnu-gcc-libc
pkgver=14.2.0
_pkgdate=2024.11.01
_pkgfilename="x86_64-cross-tools-loongarch64-binutils_2.43.1-gcc_14.2.0-glibc_2.40.tar.xz"
_target="loongarch64-unknown-linux-gnu"
pkgrel=4
pkgdesc="Build tools for Loongson (Binary)."
arch=('x86_64')
url="https://github.com/loongson/build-tools"
license=(GPL LGPL FDL)
makedepends=('coreutils' 'pacman' 'tar' 'xz')
conflicts=('loongarch64-linux-gnu-gcc')
source=("https://github.com/loongson/build-tools/releases/download/${_pkgdate}/${_pkgfilename}")
sha256sums=('3405faee1cb757d9e42962013a3fe0dfb62ebf44b4c0739833f4b9528a99a017')
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
