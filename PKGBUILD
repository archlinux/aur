# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=amazon-ec2-metadata-mock-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="Simulate Amazon EC2 instance metadata"
arch=('x86_64' 'aarch64')
url="https://github.com/aws/amazon-ec2-metadata-mock"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/aws/amazon-ec2-metadata-mock/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ec2-metadata-mock-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ec2-metadata-mock-linux-arm64.tar.gz")
sha256sums=('c8858a5a76440bbca484e134cf7df46385d090dd18b2c58e650f939258802e5b')
sha256sums_x86_64=('0d315864868bd8b9a357184bc8b7991da133ed223c1fda88c4eadae2e559f4b9')
sha256sums_aarch64=('f53e402f27aae617ecc272d4304b14d1be9537d6c859e4a73156a66fc629c8c0')

package() {
  install -Dm755 "ec2-metadata-mock" "${pkgdir}/usr/bin/ec2-metadata-mock"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
