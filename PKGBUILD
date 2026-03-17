pkgname=peekoo-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Desktop AI pet and productivity companion"
arch=('x86_64')
url="https://github.com/feed-mob/peekoo-ai"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'libnotify')
optdepends=('xdg-utils: open external links')
options=('!strip')
source=(
  "https://github.com/feed-mob/peekoo-ai/releases/download/v${pkgver}/Peekoo_${pkgver}_amd64.AppImage"
  'peekoo.desktop'
  'peekoo.sh'
  'peekoo.png'
)
sha256sums=(
  '6b0a11e5a7938b493e88bfce4373cb152c7cee7154f5676bf7d8742a4389c828'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "${srcdir}/Peekoo_${pkgver}_amd64.AppImage" "${pkgdir}/opt/peekoo/Peekoo.AppImage"
  install -Dm755 "${srcdir}/peekoo.sh" "${pkgdir}/usr/bin/peekoo"
  install -Dm644 "${srcdir}/peekoo.desktop" "${pkgdir}/usr/share/applications/peekoo.desktop"
  install -Dm644 "${srcdir}/peekoo.png" "${pkgdir}/usr/share/pixmaps/peekoo.png"
}
