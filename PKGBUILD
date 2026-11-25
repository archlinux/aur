# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kumo-bin
pkgver=0.33.1
pkgrel=1
pkgdesc="Lightweight AWS service emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/sivchari/kumo"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kumo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kumo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9a24c473f642c9a657b183f8c21f9e07eda1035fca565f504c2e9548482cc18d')
sha256sums_aarch64=('354239b998502f680e071f37cfed80fb506573fd3bb4e9fc39028abd22d79d43')

package() {
  install -Dm755 "kumo" "${pkgdir}/usr/bin/kumo"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
