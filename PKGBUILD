# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Joel Pedraza <pkgs@joelpedraza.com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

pkgname=android-google-repository
pkgver=r28
pkgrel=1
pkgdesc='Android SDK Local Maven repository for Google Libraries'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/google_m2repository_${pkgver}.zip"
	"source.properties")

sha1sums=('05ce60de2ddb4bfe30dd939570fee0b063d9b84e'
          '1a473f14dc57d8dad80a76117f34bcc1129e6ca9')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/google/m2repository"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/m2repository/source.properties"
}
