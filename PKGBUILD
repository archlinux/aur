# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=android-sdk-cmdline-tools-latest
pkgver=2.1
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
source=('https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip'
        "${pkgname}.sh"
        "${pkgname}.csh")
sha1sums=('9172381ff070ee2a416723c1989770cf4b0d1076'
          'd16076f0a7cbc78605b5669d0928963a9866e7f4'
          '3e844b22bfcbc159280c5f9e8dfb07ff9559dde5')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/cmdline-tools/"
  cp -a 'tools' "${pkgdir}/opt/android-sdk/cmdline-tools/latest"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"
}
