# Maintainer: Sandor Nagy <sanya868-at-gmail-dot-com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-support
pkgver=r23.1
pkgrel=1
pkgdesc='Android Support Package'
arch=('any')
url="https://developer.android.com/sdk/compatibility-library.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/support_${pkgver}.zip" 'source.properties')
sha1sums=('c43a56fcd1c2aa620f6178a0ef529623ed77b3c7'
          'baca739b50cc7242003218fe5a53604bf9e3f131')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/android/"
  mv "${srcdir}/support" "${pkgdir}/opt/android-sdk/extras/android/support"

  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/android/support/source.properties"
}
