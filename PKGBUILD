# Maintainer: NickMarcha <https://github.com/NickMarcha>
# PKGBUILD for omni-screen-bin (AppImage from GitHub releases)
# Version is substituted by .github/workflows/aur-publish.yml

pkgname=omni-screen-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Omni Screen - multi-platform stream and link viewer"
arch=('x86_64')
url="https://github.com/NickMarcha/omni-screen"
license=('MIT')
depends=('fuse2' 'gtk3')
source=(
  "omni-screen.AppImage::https://github.com/NickMarcha/omni-screen/releases/download/v${pkgver}/Omni%20Screen-Linux-${pkgver}-x64.AppImage"
  "omni-screen.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
)
options=('!strip')

package() {
  install -Dm755 "$srcdir/omni-screen.AppImage" "$pkgdir/opt/omni-screen/omni-screen.AppImage"
  install -Dm644 "$srcdir/omni-screen.desktop" "$pkgdir/usr/share/applications/omni-screen.desktop"
  # Wrapper so the app is in PATH
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/omni-screen/omni-screen.AppImage "$pkgdir/usr/bin/omni-screen"
}
