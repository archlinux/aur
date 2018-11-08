# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

PKGEXT=.pkg.tar

_kotlin_ver=1.3.0
pkgname=kotlin-native-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A LLVM backend for the Kotlin compiler"
arch=('x86_64')
url="https://github.com/JetBrains/kotlin-native"
license=('Apache')
options=('staticlibs' 'libtool' '!strip')
depends=('java-environment' 'ncurses5-compat-libs')
provides=('kotlin-native')
conflicts=('kotlin-native' 'kotlin-native-git')
source=("https://github.com/JetBrains/kotlin/releases/download/v${_kotlin_ver}/kotlin-native-linux-${_kotlin_ver}.tar.gz")
sha256sums=('5472d7df8d1c3f2d7b0e949f9e0882931b3bae236a431cb5ba0288f941c6b82b')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib"

  cp -r "kotlin-native-linux-${_kotlin_ver}" "${pkgdir}/usr/lib/kotlin-native"
  chmod 755 "${pkgdir}/usr/lib/kotlin-native"

  ln -s /usr/lib/kotlin-native/bin/kotlinc-native "${pkgdir}/usr/bin/kotlinc-native"
  ln -s /usr/lib/kotlin-native/bin/konanc "${pkgdir}/usr/bin/konanc"
  ln -s /usr/lib/kotlin-native/bin/konan_llvm "${pkgdir}/usr/bin/konan_llvm"
  ln -s /usr/lib/kotlin-native/bin/klib "${pkgdir}/usr/bin/klib"
  ln -s /usr/lib/kotlin-native/bin/cinterop "${pkgdir}/usr/bin/cinterop"
  ln -s /usr/lib/kotlin-native/bin/jsinterop "${pkgdir}/usr/bin/jsinterop"
  ln -s /usr/lib/kotlin-native/bin/run_konan "${pkgdir}/usr/bin/run_konan"
}
