# Maintaner: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkver=5.0
_sdkint=21
_build=1504858
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
sha1sums=('66a754efb24e9bb07cc51648426443c7586c9d4a'
          '2a57deb33df767c47e02ac5a5e7f38ff3455bdbc')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  cp -dpr --no-preserve=ownership "${srcdir}/google_phone_x86-${_build}-linux-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}/source.properties"
}
