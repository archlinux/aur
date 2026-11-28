# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=myshoes-bin
pkgver=1.20.4
pkgrel=1
pkgdesc="Auto-scaling virtual machine runners for GitHub Actions"
arch=('x86_64' 'aarch64')
url="https://github.com/whywaita/myshoes"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/myshoes_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/myshoes_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ed1f397fd3679f483ed2a479ee594ef71a3d71391e6bf7e7eb5111756d01e67b')
sha256sums_aarch64=('7b26e7377518494683a5e12312a55fb66cfa7ce9432df37dad3924b109b23a21')

package() {
  install -Dm755 "myshoes" "${pkgdir}/usr/bin/myshoes"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
