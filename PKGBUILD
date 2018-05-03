# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=kotlin-native-bin
pkgver=0.7
pkgrel=1
pkgdesc="A LLVM backend for the Kotlin compiler"
arch=('x86_64')
url="https://github.com/JetBrains/kotlin-native"
license=('Apache')
options=('staticlibs' 'libtool' '!strip')
depends=('java-environment' 'ncurses5-compat-libs')
provides=('kotlin-native')
conflicts=('kotlin-native' 'kotlin-native-git')
source=("https://github.com/JetBrains/kotlin-native/releases/download/v${pkgver}/kotlin-native-linux-${pkgver}.tar.gz")
sha512sums=('b78b14e71b426effd8b62aad89535cf364284174bbb54a05d186478a23e92405f89336e98be6e83793cad61b9577e34ff26ae8c592b5c9eba04ded0f28b6a9d3')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib"

  cp -r kotlin-native-linux-${pkgver} ${pkgdir}/usr/lib/kotlin-native
  chmod 755 ${pkgdir}/usr/lib/kotlin-native

  ln -s /usr/lib/kotlin-native/bin/kotlinc-native ${pkgdir}/usr/bin/kotlinc-native
  ln -s /usr/lib/kotlin-native/bin/konanc ${pkgdir}/usr/bin/konanc
  ln -s /usr/lib/kotlin-native/bin/klib ${pkgdir}/usr/bin/klib
  ln -s /usr/lib/kotlin-native/bin/cinterop ${pkgdir}/usr/bin/cinterop
  ln -s /usr/lib/kotlin-native/bin/jsinterop ${pkgdir}/usr/bin/jsinterop
  ln -s /usr/lib/kotlin-native/bin/run_konan ${pkgdir}/usr/bin/run_konan
}
