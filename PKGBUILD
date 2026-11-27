pkgname=rea-agents
pkgver=6.10.1
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
sha256sums=('e8cf08c9fa954e998fc8868c23fa8e5f518cdb9553488ec227b31a3bb6903150')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
