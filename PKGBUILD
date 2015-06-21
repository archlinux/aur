# Maintaner: Joel Pedraza <pkgs@joelpedraza.com>

_rev=r06
_sdkver=5.0
_sdkint=21
pkgname=android-google-apis-armv7-eabi-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, API-${_sdkint} (ARM EABI v7a System Image)"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=(
	"http://dl.google.com/android/repository/sys-img/google_apis/sysimg_arm-${_sdkint}_${_rev}.zip"
	"source.properties")
sha1sums=('d75df79c6239ded8b0aef46625f333e6f99db3f7'
          '964dfc2e60a3ca20ac0302686a8805893dd775a6')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis"
  cp -dpr --no-preserve=ownership "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis/armeabi-v7a"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis/armeabi-v7a/source.properties"
}
