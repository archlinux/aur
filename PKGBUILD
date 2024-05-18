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
  # install -Ddm755 "$pkgdir"/usr/libexec/gcc
  # install -Ddm755 "$pkgdir"/usr/lib/gcc
  # install -Ddm755 "$pkgdir"/usr/bin
  # install -Ddm755 "$pkgdir"/usr/share/man
  # cp "$srcdir"/cross-tools/bin/* "$pkgdir"/usr/bin
  # cp -r "$srcdir"/cross-tools/share/man/man1 "$pkgdir"/usr/share/man
  # cp -r "$srcdir"/cross-tools/share/man/man5 "$pkgdir"/usr/share/man
  # cp -r "$srcdir"/cross-tools/libexec/gcc/* "$pkgdir"/usr/libexec/gcc
  # cp -r "$srcdir"/cross-tools/lib/gcc/* "$pkgdir"/usr/lib/gcc
  # cp -r "$srcdir"/cross-tools/target/* "$pkgdir"/usr/"$_target"
  # cp -r "$srcdir"/cross-tools/"$_target"/lib/* "$pkgdir"/usr/"$_target"/lib
  # mv "$pkgdir"/usr/"$_target"/usr/sbin/* "$pkgdir"/usr/"$_target"/sbin
  # ln -s ./usr/bin "$pkgdir"/usr/"$_target"/bin
  # ln -s ./usr/include "$pkgdir"/usr/"$_target"/include
  # ln -s ./usr/share "$pkgdir"/usr/"$_target"/share
}
