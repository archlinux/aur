# Maintainer: Pedro <pedroantoniobonaldo@gmail.com>
pkgname=workopilot-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Your AI-powered work copilot for development - task management with AI assistance"
arch=('x86_64')
url="https://github.com/pedrinhopagan/workopilot"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'alacritty'
    'tmux'
    'xdg-utils'
    'hicolor-icon-theme'
    'desktop-file-utils'
)
optdepends=(
    'opencode: AI coding assistant integration (install separately from https://opencode.ai)'
)
provides=('workopilot')
conflicts=('workopilot')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/workopilot-linux-x86_64.tar.gz")
sha256sums=('1e725988400c29a6ef17d0ff1f68d4a574c388731c414508fda60e1b3b3cbf50')

package() {
    cd "$srcdir/workopilot-linux-x86_64"
    
    install -Dm755 "workopilot" "$pkgdir/usr/bin/workopilot"
    install -Dm644 "workopilot.desktop" "$pkgdir/usr/share/applications/workopilot.desktop"
    install -Dm644 "icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/workopilot.png"
    install -Dm644 "icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/workopilot.png"
    install -Dm644 "icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/workopilot.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
