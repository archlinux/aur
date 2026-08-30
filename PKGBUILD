# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=android-sdk-cmdline-tools-latest-22
pkgver=22.0
pkgrel=1
pkgdesc='Android SDK Command-line Tools (latest, v22)'
arch=('x86_64' 'i686')
url='https://developer.android.com/studio'
license=('custom')
depends=('glibc' 'java-runtime')
optdepends=('android-sdk-platform-tools: adb, aapt, aidl, dexdump and dx'
            'android-udev: udev rules for Android devices')
provides=('android-sdk')
install="android-sdk-cmdline-tools-latest.install"
source=('https://dl.google.com/android/repository/commandlinetools-linux-15859902_latest.zip'
        "android-sdk-cmdline-tools-latest.sh"
        "android-sdk-cmdline-tools-latest.csh"
        'package.xml')
sha1sums=('040d3996a65543d22ec4bf73e4c37aa37a8d4af4'
          'cbcfb844067eb40d7cab029c481f3f94f31f0518'
          'f71b94781633743850c760322dc3b370bc63fcaa'
          '07141e2173fea5fb08131ccf05379b24c5a6e8ea')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/cmdline-tools/"
  cp -a cmdline-tools "${pkgdir}/opt/android-sdk/cmdline-tools/latest"
  install -Dm755 'package.xml' "${pkgdir}/opt/android-sdk/cmdline-tools/latest/package.xml"
  install -Dm755 "android-sdk-cmdline-tools-latest.sh" "${pkgdir}/etc/profile.d/android-sdk-cmdline-tools-latest.sh"
  install -Dm755 "android-sdk-cmdline-tools-latest.csh" "${pkgdir}/etc/profile.d/android-sdk-cmdline-tools-latest.csh"
}
