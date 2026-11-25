# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zerobyte-bin
pkgver=0.44.2
pkgrel=1
pkgdesc="Backup automation for self-hosters"
arch=('x86_64' 'aarch64')
url="https://github.com/nicotsx/zerobyte"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nicotsx/zerobyte/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/zerobyte-agent-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/zerobyte-agent-linux-arm64")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('aed756e91fb0b97f02301acde40cad5bfbe5b8a728a159669368bee43f614fdd')
sha256sums_aarch64=('9f9a8a015c6ddaae64eb865f742024b15602a9ae78d7f8c43ec70750fc168f51')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zerobyte-agent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
