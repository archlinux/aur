# Maintaner: Joel Pedraza <joel@joelpedraza.com>

_rev=r01
_sdkver=5.1
_sdkint=22
pkgname=android-google-apis-x86-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, API-${_sdkint} (x86 System Image)"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=(
	"http://dl.google.com/android/repository/sys-img/google_apis/sysimg_x86-${_sdkint}_${_rev}.zip"
	"source.properties")
sha1sums=('4d18a23357af30a7df9a8f5f31b7dc3f4d1f74b2'
          'ced9d94a69d5d93f8a44f32c094fe78ccc9b1465')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis/x86"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis/x86/source.properties"
}
