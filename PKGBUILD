# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=iamlive-bin
pkgver=1.1.28
pkgrel=1
pkgdesc="Generate IAM policies from AWS, Azure or GCP calls"
arch=('x86_64' 'aarch64')
url="https://github.com/iann0036/iamlive"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/iamlive_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/iamlive_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('aef1d41d27c5b9a513f0b96b9ff5ed0fc9c076cea5b024d50311e6a76aae13f7')
sha256sums_aarch64=('1cf213838f4e6bdc9091e3ae1e516643d11bb011e64ec6480f3a3b6dd3bb15ff')

package() {
  install -Dm755 "iamlive" "${pkgdir}/usr/bin/iamlive"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
