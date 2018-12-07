# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

PKGEXT=.pkg.tar

_kotlin_ver=1.3.11
pkgname=kotlin-native-bin
pkgver=1.0.3
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
sha256sums=('4ee15df184249d7a3dbbf2bf911e079a5a0e96728fd5c2fbd37c191980768ce3')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib"

  cp -r "kotlin-native-linux-${_kotlin_ver}" "${pkgdir}/usr/lib/kotlin-native"

  ln -s /usr/lib/kotlin-native/bin/kotlinc-native "${pkgdir}/usr/bin/kotlinc-native"
  ln -s /usr/lib/kotlin-native/bin/konanc "${pkgdir}/usr/bin/konanc"
  ln -s /usr/lib/kotlin-native/bin/konan_llvm "${pkgdir}/usr/bin/konan_llvm"
  ln -s /usr/lib/kotlin-native/bin/klib "${pkgdir}/usr/bin/klib"
  ln -s /usr/lib/kotlin-native/bin/cinterop "${pkgdir}/usr/bin/cinterop"
  ln -s /usr/lib/kotlin-native/bin/jsinterop "${pkgdir}/usr/bin/jsinterop"
  ln -s /usr/lib/kotlin-native/bin/run_konan "${pkgdir}/usr/bin/run_konan"
}
