# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tfclean-bin
pkgver=0.0.20
pkgrel=1
pkgdesc="Remove applied moved and import blocks from Terraform code"
arch=('x86_64' 'aarch64')
url="https://github.com/takaishi/tfclean"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/takaishi/tfclean/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tfclean_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tfclean_Linux_arm64.tar.gz")
sha256sums=('15470a3e7a0cbec86da29df9485a17e9bd113d6730411d1446c483d0c8ffab4a')
sha256sums_x86_64=('99451de90798df6ab6bf35737629434e70cb84d0f7b4cb88f10b2e8d40bfeab1')
sha256sums_aarch64=('6b8ba574ec0c71d4876bc76933c0be2ac948054db990aab1336a52a5696bb962')

package() {
  install -Dm755 "tfclean" "${pkgdir}/usr/bin/tfclean"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
