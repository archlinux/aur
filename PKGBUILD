# Maintainer: Sandor Nagy <sandor.nagy-at-kdemail-dot-net>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r04
_sdkver=4.2.2
_sdkint=17
pkgname=android-google-apis-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, API-${_sdkint}"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/google_apis-${_sdkint}_${_rev}.zip" 
        'source.properties')
sha1sums=('a076be0677f38df8ca5536b44dfb411a0c808c4f'
          '792cf8b9e8352cf3583b820f9dee3a347a488240')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-1742939-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
