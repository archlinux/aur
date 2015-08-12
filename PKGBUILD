# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Maintainer: blackleg <blackleg@openaliasbox.org>

_rev=r02
_sdkver=4.4W.2
_sdkint=20
pkgname=android-platform-${_sdkint,,}
pkgver=${_sdkver}_${_rev}
pkgrel=5
pkgdesc="Android SDK Platform, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
options=('!strip')
source=("http://dl.google.com/android/repository/android-${_sdkint}_${_rev}.zip")
sha512sums=('458fee18cc8c0f63e00853388cbd5a475d2ef3cf231a8aea79b0bb2ce064a1b16d34f21dff0cd21d5a02b43c1b6e1200e595bc37e4e5d6be3a0896ab544e0fd1')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

  #chmod -R ugo+rX "${pkgdir}/opt"

  #Change group users  
  #chown -R :${_sdkgroup} "${pkgdir}/opt/android-sdk"
  #Change permisions
  chmod -R ug+rwX,o=rX "${pkgdir}/opt/android-sdk"	
}
