# Maintainer: gaogaoqwq <gaogaoqwq@gmail.com>
pkgname=loongarch64-linux-gnu-gcc-libc
pkgver=14.2.0
_pkgdate=2024.08.08
_pkgfilename="x86_64-cross-tools-loongarch64-binutils_2.43-gcc_14.2.0-glibc_2.40.tar.xz"
_target="loongarch64-unknown-linux-gnu"
pkgrel=2
pkgdesc="Build tools for Loongson (Binary)."
arch=('x86_64')
url="https://github.com/loongson/build-tools"
license=(GPL LGPL FDL)
makedepends=('coreutils' 'pacman' 'tar' 'xz')
conflicts=('loongarch64-linux-gnu-gcc')
source=("https://github.com/loongson/build-tools/releases/download/${_pkgdate}/${_pkgfilename}")
sha256sums=('32995e88c085a4bc243989fab005be1bd5a3062ce26e4957c483e4f55d139a46')
options=(!debug !strip)

package() {
  install -Ddm755 "$pkgdir"/usr/"$_target"
  cp -r "$srcdir"/cross-tools/* "$pkgdir"/usr
  rm -r "$pkgdir"/usr/include/gdb
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/locale
  rm -r "$pkgdir"/usr/share/man/man7
}
