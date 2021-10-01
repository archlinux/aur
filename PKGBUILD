# Maintainer: Quint Guvernator <quint@guvernator.net>

# Note: Google has made direct links to system images somewhat difficult to
# find. For an overview of current official Android System Image download
# links, see:
# https://androidsdkmanager.azurewebsites.net/AndroidSystemImages
_rev=06

# Note: To find out which SDK semantic version number corresponds to the SDK
# integer version for the latest release of this platform, see:
# https://source.android.com/setup/start/build-numbers#platform-code-names-versions-api-levels-and-ndk-releases
_sdkver=4.4.4

_sdkint=19
pkgname=android-x86-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android x86 Atom System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/x86-${_sdkint}_r${_rev}.zip")
sha1sums=('2ac82153aae97f7eae4c5a0761224fe04321d03d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
