# Maintainer: Scott Moak <scott-dot-moak-at-gmail-dot-com>

pkgname=android-support-repository
pkgver=r15
pkgrel=1
pkgdesc='Android Support Repository Package'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android_m2repository_${pkgver}.zip")
sha1sums=('2c51feb406ce3c7e09db8339a0d680beb91b8bf1')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/android/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/android/m2repository"

  chmod -R ugo+rX "${pkgdir}/opt"
}
