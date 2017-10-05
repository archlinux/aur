# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Joel Pedraza <pkgs@joelpedraza.com>
# Contributor: Christoph Bayer <chrbayer@criby.de>
# Maintainer: farwayer <farwayer@gmail.com>

pkgname=android-google-repository
pkgver=r58
pkgrel=1
pkgdesc='Android SDK Local Maven repository for Google Libraries'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/google_m2repository_gms_v11_3_rc05_wear_2_0_5.zip"
	"source.properties")

sha1sums=('05086add9e3a0eb1b67111108d7757a4337c3f10'
          '185ba88e42fb5c27d359bbcf62e5346750c917b0')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/google/m2repository"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/m2repository/source.properties"
}
