# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributors: goetzc, Skycoder42
# Contributors: lestb, Philipp Wolfer, Joel Pedraza, Jakub Schmidtke

pkgname=android-platform-30
_apilevel=30
_rev=r03
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API 30"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/platform-${_apilevel}_${_rev}.zip")
sha1sums=('e7c6280901dcfa511af098d67dd88c4dfcbc6ea2')
sha384sums=('2ff53b95a4584f86ab06c5daaf8aabe6e8bb28eaa3cd2e4e06b9762959d84a0a331721eb3c6e39f49dd0691a961fa46c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  find "${srcdir}" -maxdepth 1 -mindepth 1 -type d | grep -P 'android-[0-9]+(\.[0-9]*)*$' | while read directory; do
      mv "${directory}" "${pkgdir}/opt/android-sdk/platforms/android-${_apilevel}"
  done

  chmod -R ugo+rX "${pkgdir}/opt"
}
