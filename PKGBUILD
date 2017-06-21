# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

# Taken from android-sdk

_pkgname=android-sdk
pkgname="${_pkgname}-dummy"
pkgver=26.0.2
pkgrel=1
pkgdesc='Google Android SDK, dummy package'
arch=('i686' 'x86_64')
url='https://developer.android.com/studio/releases/sdk-tools.html'
license=('custom')
depends_i686=('java-environment' 'libxtst' 'fontconfig' 'freetype2' 'gcc-libs'
              'libx11' 'libxext' 'libxrender' 'zlib')
depends_x86_64=('java-environment' 'libxtst' 'fontconfig' 'freetype2'
                'lib32-gcc-libs' 'lib32-glibc' 'libx11' 'libxext' 'libxrender'
                'zlib')
optdepends=('android-emulator: emulator has become standalone since 25.3.0'
            'android-sdk-platform-tools: adb, aapt, aidl, dexdump and dx'
            'android-udev: udev rules for Android devices')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${_pkgname}.sh::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.sh?h=${_pkgname}"
        "${_pkgname}.csh::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.csh?h=${_pkgname}"
        "${_pkgname}.conf::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.conf?h=${_pkgname}"
        "license.html::https://aur.archlinux.org/cgit/aur.git/plain/license.html?h=${_pkgname}")
sha1sums=('30a6ed281d54f8b7be08663a18c367f79c0d8d47'
          '1bd09bf137fd09171cb426daa5748f117cfb3c25'
          '145bdf3eb41a56574b289c1577a24bc47097ec83'
          'bfb91be7e0b602d765b7a1fcaf0ce1b7e1a93faa')

package() {
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
  install -Dm644 "${_pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${_pkgname}.conf"
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${_pkgname}/license.html"
}
