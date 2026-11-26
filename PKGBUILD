# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dashlit-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Self-hosted start page for links, tools and service status"
arch=('x86_64' 'aarch64')
url="https://github.com/codewec/dashlit"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dashlit_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dashlit_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1cad724ca42a601d9a6b9c4e84349e1d9abe04abf93f839151bc1dcba7f31da9')
sha256sums_aarch64=('b579c356d2e2e23b6bca64eba4764efa76927688f7b7e854eaa139f156794297')

package() {
  install -Dm755 "dashlit" "${pkgdir}/usr/bin/dashlit"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
