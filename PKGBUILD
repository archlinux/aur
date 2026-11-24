# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xpdig-bin
pkgver=1.27.0
pkgrel=1
pkgdesc="Dig into Crossplane traces via a k9s-like TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/brunoluiz/xpdig"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/xpdig_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/xpdig_Linux_arm64.tar.gz")
sha256sums_x86_64=('a91c7a15c59097b384e9abd07b77a582dfdc53c8c09e467334368b41e6e88e18')
sha256sums_aarch64=('5be6914a46e4550e04351b444364f2d7b427d7bbeab5db8abaea2c5bca500017')

package() {
  install -Dm755 "xpdig" "${pkgdir}/usr/bin/xpdig"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
