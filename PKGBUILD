# Maintainer: Scott Moak <scott-dot-moak-at-gmail-dot-com>

pkgname=android-support-repository
pkgver=r28
pkgrel=1
pkgdesc='Android Support Repository Package'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android_m2repository_${pkgver}.zip")
sha1sums=('e4d0ad49df085a8d0322cfc4cfaa5e74a7b0569b')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/android/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/android/m2repository"

  chmod -R ugo+rX "${pkgdir}/opt"
}
