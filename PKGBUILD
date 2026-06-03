# Maintainer: Leonardo Panseri <leonardo.panseri+aur@gmail.com>

pkgname=cosmic-ext-applet-yapcap-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='COSMIC panel applet for Codex, Claude Code, Cursor, Gemini, and Copilot usage'
arch=('x86_64')
url='https://github.com/TopiCsarno/yapcap'
license=('MPL-2.0')
depends=(
  'glibc'
  'gcc-libs'
  'fontconfig'
  'openssl'
  'wayland'
  'libxkbcommon'
)
provides=('cosmic-ext-applet-yapcap')
conflicts=('cosmic-ext-applet-yapcap')
options=('!strip')
source_x86_64=("yapcap-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/yapcap-${pkgver}-x86_64-linux.tar.gz")
sha256sums_x86_64=('68fa1b9d618d9c40020f95c8991d2f1a1b99f3936617667693f488e8143a3d18')

package() {
  cd "yapcap-${pkgver}-x86_64-linux"

  install -Dm755 yapcap "${pkgdir}/usr/bin/yapcap"
  install -Dm644 resources/app.desktop "${pkgdir}/usr/share/applications/io.github.TopiCsarno.YapCap.desktop"
  install -Dm644 resources/app.metainfo.xml "${pkgdir}/usr/share/metainfo/io.github.TopiCsarno.YapCap.metainfo.xml"
  install -Dm644 resources/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.TopiCsarno.YapCap.svg"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
