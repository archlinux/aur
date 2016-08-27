# Maintainer: Sandor Nagy <sandor-dot-nagy-at-kdemail-dot-net>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_api=16
_ver=4.1.2
_rev=r04
_suffix="1747107-mac-x86"

pkgname=android-google-apis-${_api}
pkgver=${_ver}_${_rev}
pkgrel=1
pkgdesc='Android Google APIs, API-${_api}'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_api}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-${_api}_${_rev}.zip"
        "source.properties")
sha1sums=('ee6acf1b01020bfa8a8e24725dbc4478bee5e792'
          '02020191872babe5496d33caa0ee23fa728bbeb6')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-${_suffix}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
