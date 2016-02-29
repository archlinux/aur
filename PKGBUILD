# Maintaner: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r09
_sdkver=4.4.2
_sdkint=19
_build=1532129
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
sha1sums=('a0cdca419e4bab9274c7eb56f4ad1df51bf4b837'
          '95dc4d637d26bee19067d13e06879548230312f1')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  cp -dpr --no-preserve=ownership "${srcdir}/google_apis-${_build}-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}/source.properties"
}
