# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ytunnel-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A TUI-first CLI for managing Cloudflare Tunnels with custom domains"
arch=('x86_64' 'aarch64')
url="https://github.com/yetidevworks/ytunnel"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yetidevworks/ytunnel/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ytunnel-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ytunnel-linux-aarch64.tar.gz")
sha256sums=('a73c0b7efb80d9589f06f165a0d6159a1b1e7c2167c812ce588f06073d9dcc99')
sha256sums_x86_64=('db70757c6ad1a281c17a3f979e8be368f681a6f3170201e77b5aeb82aaec264e')
sha256sums_aarch64=('caae8f7d8072e33964b9784d3906c8d7343ac8eeda7ddbde5baf62247ff67f8e')

package() {
  install -Dm755 "ytunnel" "${pkgdir}/usr/bin/ytunnel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
