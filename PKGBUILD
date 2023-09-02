# Maintainer: slot_FGHNBB <Hidden>
pkgname=fix-gs-keyboard-function-key
pkgver=1.0.0
pkgrel=1
pkgdesc="修复高斯键盘在Arch下Function键输入的问题 (Fixed the problem that Gaosi keyboard entered the Function key under Arch)"
arch=("x86_64")
url="https://github.com/FGHNBB/fix-gs-keyboard-function-key"
license=("GPL")
makedepends=("git" "cmake")
source=("git+https://github.com/FGHNBB/fix-gs-keyboard-function-key.git")
sha256sums=("SKIP")

build() {
  mkdir -p "$srcdir/fix-gs-keyboard-function-key/build"
  cd "$srcdir/fix-gs-keyboard-function-key/build"
  msg2 "Using Cmake to Build"
  cmake ..
  make
  msg2 "Build Done"
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/fix-gs-keyboard-function-key/build/fix-gs-keyboard-function-key $pkgdir/usr/bin/fix-gs-keyboard-function-key
  chmod +x $pkgdir/usr/bin/fix-gs-keyboard-function-key
  msg2 "Installation Done! Please use 'sudo fix-gs-keyboard-function-key install' to install the patch"
}
