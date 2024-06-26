# Maintainer: gaogaoqwq <gaogaoqwq@gmail.com>
pkgname=loongarch64-linux-gnu-gcc-libc
pkgver=14.1.0
_pkgdate=2024.06.01
_target="loongarch64-unknown-linux-gnu"
pkgrel=1
pkgdesc="Build tools for Loongson (Binary)."
arch=('x86_64')
url="https://github.com/loongson/build-tools"
license=(GPL LGPL FDL)
makedepends=('coreutils' 'pacman' 'tar' 'xz')
conflicts=('loongarch64-linux-gnu-gcc')
source=("https://github.com/loongson/build-tools/releases/download/${_pkgdate}/x86_64-cross-tools-loongarch64-binutils_2.42-gcc_14.1.0-glibc_2.39.tar.xz")
sha256sums=('7d52448b62feab2f252e45c29cd0d70a26a21f32531ca5485d237de75117adaa')
options=(!debug)

package() {
  install -Ddm755 "$pkgdir"/usr/"$_target"
  cp -r "$srcdir"/cross-tools/* "$pkgdir"/usr
  rm -r "$pkgdir"/usr/include/gdb
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/locale
  rm -r "$pkgdir"/usr/share/man/man7
}
