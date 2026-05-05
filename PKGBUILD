# Maintainer: Gary <garylinux666@aur.archlinux.org>
# Contributor: Open Design upstream <https://github.com/nexu-io/open-design>

pkgname=open-design-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Local-first design product – Electron desktop (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/nexu-io/open-design"
license=('Apache-2.0')
depends=('fuse2')
optdepends=('open-design: daemon + web UI (CLI-only companion package)')
source=("${pkgname}-${pkgver}.AppImage")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/usr/bin/open-design"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/open-design.desktop" << 'DESKTOP'
[Desktop Entry]
Type=Application
Name=Open Design
GenericName=Design Agent
Comment=Local-first design product with code-agent integration
Exec=/usr/bin/open-design
Icon=open-design
Categories=Development;Utility;
StartupNotify=true
Terminal=false
Keywords=design;prototype;agent;ai;
DESKTOP

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICEOF'
Apache-2.0. See https://github.com/nexu-io/open-design/blob/main/LICENSE
LICEOF
}
