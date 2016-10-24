# Maintainer: johnguant <rhys @t johnguant dot com>

_rev=r01
_sdkver=7.1.1
_sdkint=25
pkgname=android-tv-x86-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android TV Intel x86 Atom System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/tv/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
optdepends=('qemu-kvm' 'libvirt')
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android-tv/x86-${_sdkint}_${_rev}.zip")
sha1sums=('d43bfb4c90943f491ee7b0d288431afacfa7f92e')

package() {
  install -Dm644 "${srcdir}/x86/NOTICE.txt" "${pkgdir}/usr/share/licenses/$pkgname/NOTICE.txt"

  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/android-tv"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/android-tv/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
