# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=kotlin-native-bin
pkgver=0.6.2
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
sha512sums=('4600216116e9480550ada878b4365b4e391c4d355964e19e2e3011a92ba5afe2bb1844691c3ecb730b1d1d8d299c668a22cec0cacdf4d6b8712fe1d6c079a929')

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
