# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=unbrowse-bin
pkgver=13.1.0
pkgrel=1
pkgdesc="Let AI agents use websites through learned HTTP requests instead of a browser"
arch=('x86_64' 'aarch64')
url="https://github.com/unbrowse-ai/unbrowse"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/unbrowse-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/unbrowse-linux-arm64-${pkgver}.tgz")
sha256sums_x86_64=('97974f61284e10bfc8fa1c8bcc28a5d497d92ff7f2d6ff262238852ba1b1db66')
sha256sums_aarch64=('0cc812541c1f009edd6855a2d514169594cecaadd6ce8cc39eac613f0b42efb4')

package() {
  install -Dm755 "package/bin/unb" "${pkgdir}/usr/bin/unb"
  install -Dm755 "package/bin/unbrowse-node" "${pkgdir}/usr/bin/unbrowse-node"
  install -Dm755 "package/bin/unbrowse-window" "${pkgdir}/usr/bin/unbrowse-window"
  install -Dm644 "package/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/bin/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
