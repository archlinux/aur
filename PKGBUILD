# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sshmon-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Manage and monitor SSH connections"
arch=('x86_64')
url="https://github.com/hpello/sshmon"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/hpello/sshmon/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sshmon-linux-x64-${pkgver}.tar.gz")
sha256sums=('7b2f82e21708611029c33d2e62c91b4ee677347973bb9a095fc72e8f081fc0fc')
sha256sums_x86_64=('7256d8ef04cdb48a1f121821b9226368ea2a568c3c69efca2e2e2e2fbe57c8c4')

package() {
  install -Dm755 "./sshmon" "${pkgdir}/usr/bin/sshmon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
