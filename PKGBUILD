# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

# Taken from android-sdk-cmdline-tools-latest

_pkgname=android-sdk-cmdline-tools-latest
pkgname="${_pkgname}-dummy"
pkgver=13.0
pkgrel=1
_pkgdesc='Android SDK Command-line Tools (latest)'
pkgdesc="${_pkgdesc}, dummy package"
arch=('x86_64' 'i686')
url='https://developer.android.com/studio'
license=('custom')
depends=('glibc' 'java-runtime')
optdepends=('android-sdk-platform-tools: adb, aapt, aidl, dexdump and dx'
            'android-udev: udev rules for Android devices')
provides=('android-sdk' "${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${_pkgname}.sh::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.sh?h=${_pkgname}"
        "${_pkgname}.csh::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.csh?h=${_pkgname}")
sha1sums=('cbcfb844067eb40d7cab029c481f3f94f31f0518'
          'f71b94781633743850c760322dc3b370bc63fcaa')

package() {
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
}
