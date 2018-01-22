# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcfanno-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Annotate a VCF with other VCFs/BEDs/tabixed files"
arch=('x86_64')
url=https://github.com/brentp/"${pkgname//-bin/}"
license=('MIT')
provides=('vcfanno')
conflicts=('vcfanno')
source=(
  "${pkgname//-bin/}"-"${pkgver}".tar.gz::https://github.com/brentp/"${pkgname//-bin/}"/archive/v"${pkgver}".tar.gz
  "${pkgname//-bin/}"-"${pkgver}"-binary::https://github.com/brentp/"${pkgname//-bin/}"/releases/download/v"${pkgver}"/"${pkgname//-bin/}"_linux64
)
sha256sums=(
  'cdb550f28d9b6d15105432b0414afa735a352839e27eda4efa954f29c000e7f8'
  '72caf9aeb0dceabea8ad4677a075ddb75b9cc1ba9779bb786033c35dde05fe73'
)

package() {
  install -Dm644 "${pkgname//-bin/}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname//-bin/}"/LICENSE
  install -Dm775 "${srcdir}"/"${pkgname//-bin/}"-"${pkgver}"-binary "${pkgdir}"/usr/bin/"${pkgname//-bin/}"
}
