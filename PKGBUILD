# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=android-sdk-cmdline-tools-latest
pkgver=23.0
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
source=('https://dl.google.com/android/repository/commandlinetools-linux-16111833_latest.zip'
        "${pkgname}.sh"
        "${pkgname}.csh"
        'package.xml')
sha1sums=('e025545c62a8e64c7559119566a569fb1dec5f60'
          'cbcfb844067eb40d7cab029c481f3f94f31f0518'
          'f71b94781633743850c760322dc3b370bc63fcaa'
          'ab8ba18b0815bda3000c57e63e99b841aed2739b')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/cmdline-tools/"
  cp -a cmdline-tools "${pkgdir}/opt/android-sdk/cmdline-tools/latest"
  install -Dm755 'package.xml' "${pkgdir}/opt/android-sdk/cmdline-tools/latest/package.xml"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"
}
