# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=android-sdk-cmdline-tools-latest
pkgver=16.0
pkgrel=1
pkgdesc='Android SDK Command-line Tools (latest)'
arch=('x86_64' 'i686')
url='https://developer.android.com/studio'
license=('custom')
depends=('glibc' 'java-runtime')
optdepends=('android-sdk-platform-tools: adb, aapt, aidl, dexdump and dx'
            'android-udev: udev rules for Android devices')
provides=('android-sdk')
install="${pkgname}.install"
source=('https://dl.google.com/android/repository/commandlinetools-linux-12266719_latest.zip'
        "${pkgname}.sh"
        "${pkgname}.csh"
        'package.xml')
sha1sums=('47e61d3bb57b5e907a74f225a767a767a8b4d7a5'
          'cbcfb844067eb40d7cab029c481f3f94f31f0518'
          'f71b94781633743850c760322dc3b370bc63fcaa'
          'df030d6a69c9a502c01dae9041de4f6fc582ee5d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/cmdline-tools/"
  cp -a cmdline-tools "${pkgdir}/opt/android-sdk/cmdline-tools/latest"
  install -Dm755 'package.xml' "${pkgdir}/opt/android-sdk/cmdline-tools/latest/package.xml"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"
}
