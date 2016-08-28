# Maintainer: Sandor Nagy <sandor-dot-nagy-at-kdemail-dot-net>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r20
_sdkver=4.4.2
_sdkint=19
_build=2884604-linux-x86
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
sha1sums=('5b933abe830b2f25b4c0f171d45e9e0651e56311'
          'b25a29fd42f20584e733846bd454eb4a6a27051c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  cp -dpr --no-preserve=ownership "${srcdir}/google_apis-${_build}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}/source.properties"
}
