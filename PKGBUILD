# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aven-bin
pkgver=0.1.56
pkgrel=1
pkgdesc="A local-first task manager for power users and agents, with a keyboard-driven TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/raine/aven"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/raine/aven/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/aven-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/aven-linux-arm64.tar.gz")
sha256sums=('dfc0be306ac621b63914bf0f4854538a2e0a8d09ad24f20e7edd9a80ece241b2')
sha256sums_x86_64=('ec3a8066aaa2e014bc40bd30973b9f7a8603b262efa33690f407ded00238cbb1')
sha256sums_aarch64=('f8e36e9ef62642fa62f5a1999acafcd4bb15a11686995f23ea2b518a17f4057f')

package() {
  install -Dm755 "aven" "${pkgdir}/usr/bin/aven"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
