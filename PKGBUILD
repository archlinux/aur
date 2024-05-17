# Maintainer: gaogaoqwq <gaogaoqwq@gmail.com>
pkgname=loongarch64-linux-gnu-gcc-libc
pkgver=14.0.0
_pkgdate=2023.08.08
pkgrel=1
pkgdesc="Build tools for Loongson (Binary)."
arch=('x86_64')
url="https://github.com/loongson/build-tools"
license=(GPL LGPL FDL)
makedepends=('coreutils' 'pacman' 'tar' 'xz')
source=("https://github.com/loongson/build-tools/releases/download/${_pkgdate}/x86_64-cross-tools-loongarch64-gcc-libc.tar.xz")
sha256sums=("2595bc127a2198f5303f80ec09ea2e21004e5ea0b52fbf495e26c6abf2ec9a81")
options=(!debug)

package() {
  install -Ddm755 "$pkgdir"/usr/loongarch64-unknown-linux-gnu
  install -Ddm755 "$pkgdir"/usr/bin
  install -Ddm755 "$pkgdir"/usr/share/man
  cp "$srcdir"/cross-tools/bin/* "$pkgdir"/usr/bin
  cp -r "$srcdir"/cross-tools/share/man/man1 "$pkgdir"/usr/share/man
  cp -r "$srcdir"/cross-tools/share/man/man5 "$pkgdir"/usr/share/man
  cp -r "$srcdir"/cross-tools/loongarch64-unknown-linux-gnu/* "$pkgdir"/usr/loongarch64-unknown-linux-gnu
}
