pkgname=rea-agents
pkgver=6.4.0
pkgrel=1
pkgdesc="Reverse engineer anything from your terminal or agent with one CLI and MCP server"
arch=('any')
url="https://github.com/morluto/rea"
license=('MIT')
depends=('nodejs>=22.19' 'npm')
makedepends=('npm')
optdepends=(
  'hopper4: native binary analysis (Hopper provider, AUR, commercial)'
  'ghidra: native binary analysis (Ghidra provider)'
  'jadx: Android APK analysis'
  'android-apktool: Android resource decoding'
  'android-tools: ADB device analysis'
)
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('59eb1604b8db75f522d4a975c36ce6b4a2ad465e43bad165f9a8f728391db9b8')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
