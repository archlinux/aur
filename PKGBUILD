# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flowpipe-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="Cloud scripting and workflow automation engine"
arch=('x86_64' 'aarch64')
url="https://github.com/turbot/flowpipe"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/turbot/flowpipe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/flowpipe.linux.amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/flowpipe.linux.arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('f553fc0f9b019c5de8cffa7dcc4c8b2a0fea73708e66afac925a6c2a92b98334')
sha256sums_aarch64=('09c76600c4558f7b2a9b5f608d5d49d0fafb5f91262bc3b5e46ab6348f9634be')

package() {
  install -Dm755 "flowpipe" "${pkgdir}/usr/bin/flowpipe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
