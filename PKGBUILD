# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wardgate-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Security gateway for AI agents with credential isolation and policy-gated execution"
arch=('x86_64' 'aarch64')
url="https://github.com/wardgate/wardgate"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wardgate_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wardgate_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('709e6e5e00d21dac4c62177553a28b9474697da53e9f7ebfd475503902de2273')
sha256sums_aarch64=('e127471228c42545b4696e884b2267c8b466fdb3ff4562331dc0762545753dd8')

package() {
  install -Dm755 "wardgate" "${pkgdir}/usr/bin/wardgate"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
