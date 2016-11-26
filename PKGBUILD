# Maintainer: Sandor Nagy <sandor dot nagy at kdemail dot net>
# Contributor: johnguant <rhys @t johnguant dot com>

_rev=r03
_sdkver=5.1
_sdkint=22
pkgname=android-tv-x86-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android TV x86 System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/tv/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
optdepends=('qemu-kvm' 'libvirt')
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android-tv/sysimg_atv_x86-${_sdkint}_${_rev}.zip")
md5sums=('0d99844e00b3442c25c840a1256f694d')

package() {
  install -Dm644 "${srcdir}/x86/NOTICE.txt" "${pkgdir}/usr/share/licenses/$pkgname/NOTICE.txt"

  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/android-tv"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/android-tv/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
