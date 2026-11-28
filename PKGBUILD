# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fennara-godot-ai-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="AI chat and agent tooling for the Godot engine with MCP support"
arch=('x86_64')
url="https://github.com/fennaraOfficial/fennara-godot-ai"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fennaraOfficial/fennara-godot-ai/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/fennara-cli-linux-x86_64-v${pkgver}.zip")
sha256sums=('6b6469d626826ccf127349d9e5d83ff74d319b2a37881f7f60151e8beb95a7f4')
sha256sums_x86_64=('9a17e2299cdadd299e7d915cf0154e64a1a5b47d293f924b1ae532e564ba1aab')

package() {
  install -Dm755 "bin/fennara" "${pkgdir}/usr/bin/fennara"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
