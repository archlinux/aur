# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Alexandre Macabies <web+oss@zopieux.com>

_rev=r04
_sdkver=4.3
_sdkint=18
pkgname=android-google-apis-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, API-${_sdkint}"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=(
	"http://dl.google.com/android/repository/google_apis-${_sdkint}_${_rev}.zip"
	"source.properties")
sha1sums=('6109603409debdd40854d4d4a92eaf8481462c8b'
          '852c4fabee1c7150969ecd63dad2986a1e261916')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-1743067-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
