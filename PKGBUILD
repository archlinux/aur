# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Joel Pedraza <pkgs@joelpedraza.com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

pkgname=android-google-repository
pkgver=r25
pkgrel=1
pkgdesc='Android SDK Local Maven repository for Google Libraries'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/google_m2repository_${pkgver}.zip"
	"source.properties")

sha1sums=('10316852a8713e19490ee25e56beb2c00cc0b147'
          '7cf1e900749f35ee8afd6e63ad76c08d609acea4')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/google/m2repository"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/m2repository/source.properties"
}
