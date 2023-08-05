# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=android-sdk-cmdline-tools-latest
pkgver=11.0
pkgrel=1
pkgdesc='Android SDK Command-line Tools (latest)'
arch=('x86_64' 'i686')
url='https://developer.android.com/studio'
license=('custom')
depends=('glibc' 'java-environment')
optdepends=('android-sdk-platform-tools: adb, aapt, aidl, dexdump and dx'
            'android-udev: udev rules for Android devices')
provides=('android-sdk')
install="${pkgname}.install"
source=('https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip'
        "${pkgname}.sh"
        "${pkgname}.csh")
sha1sums=('87b485c7283cba69e41c10f05bf832d2fd691552'
          'cbcfb844067eb40d7cab029c481f3f94f31f0518'
          'f71b94781633743850c760322dc3b370bc63fcaa')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/cmdline-tools/"
  cp -a cmdline-tools "${pkgdir}/opt/android-sdk/cmdline-tools/latest"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"
}
