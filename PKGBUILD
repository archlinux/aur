# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slashdocs-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Let AI agents publish reviewable HTML documents"
arch=('x86_64' 'aarch64')
url="https://github.com/razorpay/slashdocs"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/slashdocs_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/slashdocs_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a30474c1b13575d3913d1d0af7c153b14ef32b94cdf7605397d23fce02bdc77c')
sha256sums_aarch64=('0ae19b91f4c7947994a39dab4f7802199d52f9b9649ea991e084a695552684ef')

package() {
  install -Dm755 "slashdocs" "${pkgdir}/usr/bin/slashdocs"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
