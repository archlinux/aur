# Maintaner: Joel Pedraza <joel@joelpedraza.com>

_rev=r07
_sdkver=6.0
_sdkint=23
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
sha1sums=('0452e1490eabcb1d7bf88625ec91b3278d88dee8'
          '5a0bc3a49ab73110685ad1d491bcfb460e0e0e0e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis/x86"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis/x86/source.properties"
}
