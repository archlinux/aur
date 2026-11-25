# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=semantix-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Cross-session memory and work reuse for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Gnosil/semantix"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Gnosil/semantix/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/semantix-agent-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/semantix-agent-linux-arm64.tar.gz")
sha256sums=('68aa0433e6ab8a725df1f89fae138de316f46241bc854415b46ae2d05e5183b6')
sha256sums_x86_64=('fc09a2c122a88b70f6b2c3d4fdc88e87820b6cd7a107d22e0d7d9079ff534107')
sha256sums_aarch64=('ec85a8600fb04907c95806645c852c6bb24ac092c9e44b92b69faeacede021d8')

package() {
  install -Dm755 "semantix-agent" "${pkgdir}/usr/bin/semantix-agent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
