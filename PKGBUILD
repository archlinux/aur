# Maintainer: Maximilian Schmidt <maximilian@schmidt.so>

pkgname=zotgo-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="CLI for a running Zotero 7+ desktop app"
arch=('x86_64' 'aarch64')
url="https://github.com/CameronBrooks11/zotgo"
license=('AGPL-3.0-only')
provides=("zotgo=${pkgver}")
conflicts=('zotgo' 'zot')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/zot_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('cc546fb57c56c3af50749e0d8e060184a0513149183549c9f5784c38071f76ac')
source_aarch64=("${url}/releases/download/v${pkgver}/zot_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('d35e9ab25f713ba95dbba54011240be95bfd36b91690303fb4f654c6a51c0e00')

package() {
  install -Dm755 "${srcdir}/zot" "${pkgdir}/usr/bin/zot"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
