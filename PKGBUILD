pkgname=rea-agents
pkgver=6.8.0
pkgrel=1
pkgdesc="Reverse engineer anything from your terminal or agent with one CLI and MCP server"
arch=('any')
url="https://github.com/morluto/rea"
license=('MIT')
depends=('nodejs>=22.23.4' 'npm')
makedepends=('npm')
optdepends=(
  'hopper4: native binary analysis (Hopper provider, AUR, commercial)'
  'ghidra: native binary analysis (Ghidra provider)'
  'jadx: Android APK analysis'
  'android-apktool: Android resource decoding'
  'android-tools: ADB device analysis'
  'python-pwntools: offline ELF layout, EVM bytecode and recorded-crash analysis'
  'pwndbg: optional recorded-crash debugging'
  'mitmproxy: native mitmproxy capture imports'
  'chromium: browser and web capture analysis'
)
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('8d542ec76a9cb350584b60a6c9c088706ff812d5bb5b094c20c95b6dc25698bb')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
