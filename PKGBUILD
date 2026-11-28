# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=honeydet-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Signature-based honeypot detector"
arch=('x86_64' 'aarch64')
url="https://github.com/referefref/honeydet"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/honeydet_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/honeydet_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('45fdb4872a911bff02e66691cb6045dcbfb238a379e1d28ec2ed7b1f99f64b80')
sha256sums_aarch64=('f1d6eb310eaa1b01b8e20af31de61d1ad4445f8378e3893b81871f11f3b7e7c9')

package() {
  install -Dm755 "honeydet" "${pkgdir}/usr/bin/honeydet"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
