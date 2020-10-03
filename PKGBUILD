# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributors: goetzc, Skycoder42
# Contributors: lestb, Philipp Wolfer, Joel Pedraza, Jakub Schmidtke

pkgname=android-platform-30
_apilevel=30
_rev=r02
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API 30"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/platform-${_apilevel}_${_rev}.zip")
sha1sums=('0b1102c5f0be7bc629e396fcefd36b9f1edfa0a7')
sha384sums=('035f8aa55d9543b21406d9e9956f65bc427b3812420b53618ec1b810ae1adb9c2dbeecafdab1d83d4901943bec63cc14')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  find "${srcdir}" -maxdepth 1 -mindepth 1 -type d | grep -P 'android-[0-9]+(\.[0-9]*)*$' | while read directory; do
      mv "${directory}" "${pkgdir}/opt/android-sdk/platforms/android-${_apilevel}"
  done

  chmod -R ugo+rX "${pkgdir}/opt"
}
