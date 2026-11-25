# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=docktail-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Label-based Tailscale Services for Docker containers"
arch=('x86_64' 'aarch64')
url="https://github.com/marvinvr/docktail"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/docktail_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/docktail_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7e25fafeb7dc539493b7e4718c6b4f741a9fb65d28933fb8bf6f771470060f10')
sha256sums_aarch64=('d71e4c35a349c5ac1034d5bf30c6beb3045f19801c7172cbeb9eb906aa665cb5')

package() {
  install -Dm755 "docktail" "${pkgdir}/usr/bin/docktail"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
