# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herm-bin
pkgver=0.8.7
pkgrel=1
pkgdesc="Terminal-native AI coding agent running in containers"
arch=('x86_64' 'aarch64')
url="https://github.com/aduermael/herm"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/herm_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/herm_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('efd1d51ce0bda7f2f72a65b2e788a07271620b20d157a77ba81e99dbf901cc20')
sha256sums_aarch64=('e14511141f96858e0614b10f6d6043f069b8088971ec2060a526be4ca7ea9aba')

package() {
  install -Dm755 "herm" "${pkgdir}/usr/bin/herm"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
