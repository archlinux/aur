# Maintainer: gaogaoqwq <gaogaoqwq@gmail.com>
pkgname=loongarch64-linux-gnu-gcc-libc
pkgver=14.0.0
_pkgdate=2023.08.08
_target="loongarch64-unknown-linux-gnu"
pkgrel=2
pkgdesc="Build tools for Loongson (Binary)."
arch=('x86_64')
url="https://github.com/loongson/build-tools"
license=(GPL LGPL FDL)
makedepends=('coreutils' 'pacman' 'tar' 'xz')
source=("https://github.com/loongson/build-tools/releases/download/${_pkgdate}/x86_64-cross-tools-loongarch64-gcc-libc.tar.xz")
sha256sums=("2595bc127a2198f5303f80ec09ea2e21004e5ea0b52fbf495e26c6abf2ec9a81")
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
