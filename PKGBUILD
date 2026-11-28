# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flares-bin
pkgver=4.0.1
pkgrel=1
pkgdesc="Cloudflare DNS backup tool"
arch=('x86_64' 'aarch64')
url="https://github.com/lfaoro/flares"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/flares_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/flares_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fcc001ab0c82096bf2f852b9dd2c611ce521066b7a6cbfae9a19ffec5536ed54')
sha256sums_aarch64=('4bd2f8f8d3f29c14bb027125985858e482a9b52787227f845dbe7c1f02fea497')

package() {
  install -Dm755 "flares" "${pkgdir}/usr/bin/flares"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
