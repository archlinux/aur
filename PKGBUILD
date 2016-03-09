# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Iwan Gabovitch <qubodup@gmail.com>

_rev=r05
_ver=4.0.4
_api=15
pkgname=android-platform-${_api}
pkgver=${_ver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API-${_api}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-${_api}_${_rev}.zip")
sha1sums=('69ab4c443b37184b2883af1fd38cc20cbeffd0f3')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_ver}" "${pkgdir}/opt/android-sdk/platforms/android-${_api}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
