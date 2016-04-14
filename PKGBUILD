# Maintainer: Scott Moak <scott-dot-moak-at-gmail-dot-com>

pkgname=android-support-repository
pkgver=r30
pkgrel=1
pkgdesc='Android Support Repository Package'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android_m2repository_${pkgver}.zip")
sha1sums=('a06aadc0a32f1cd1c44e8004385929b17425fc37')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/android/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/android/m2repository"

  chmod -R ugo+rX "${pkgdir}/opt"
}
