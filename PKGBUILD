# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Joel Pedraza <pkgs@joelpedraza.com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

pkgname=android-google-repository
pkgver=r24
pkgrel=1
pkgdesc='Android SDK Local Maven repository for Google Libraries'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/google_m2repository_${pkgver}.zip"
	"source.properties")

sha1sums=('7e9607f15c824e554bb9acde604b2a1b6f9c9dff'
          '18b39f1ea7c70b247be9a88ebcf029a7d592b08f')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/google/m2repository"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/m2repository/source.properties"
}
