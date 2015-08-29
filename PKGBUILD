# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Joel Pedraza <pkgs@joelpedraza.com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

pkgname=android-google-repository
pkgver=r21
pkgrel=2
pkgdesc='Android SDK Local Maven repository for Google Libraries'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/google_m2repository_${pkgver}.zip"
	"source.properties")

sha1sums=('056436bdbdb973e6f125bd16ba9e3bdcd1d33e6f'
          'df08b2d75ddfa2283decb43e8f6906fa4de166d5')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/google/m2repository"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/m2repository/source.properties"
}
