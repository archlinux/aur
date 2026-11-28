# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=comanda-bin
pkgver=0.0.259
pkgrel=1
pkgdesc="CLI-native orchestrator for AI agent workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/kris-hansen/comanda"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/comanda-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/comanda-linux-arm64.zip")
sha256sums_x86_64=('0e4f33e2376112eb86d6f62b152e58d48e3ddc226039c6735c3ff7f48513a6e3')
sha256sums_aarch64=('03e8fa53b686a10c79c8bb6efc0dd1cf1b3b3a409a26dbe2dfa9394150b81c6c')

package() {
  install -Dm755 "comanda" "${pkgdir}/usr/bin/comanda"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
