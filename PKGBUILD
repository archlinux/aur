# Maintaner: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r1
_sdkver=7.0
_sdkint=24
_build=3249234
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
sha1sums=('31361c2868f27343ee917fbd259c1463821b6145'
          '45ccd2d2f4441f47181c8998039d555fa43b20e3')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  cp -dpr --no-preserve=ownership "${srcdir}/google_phone_x86-${_build}-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}/source.properties"
}
