# Maintainer: Ersin Can Karaca <canersinkaraca@gmail.com>
pkgname=lapse-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Save the last moments of your game and trim clips (replay recorder)"
arch=('x86_64')
url="https://github.com/canersin/Lapse"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'libglvnd' 'wayland' 'libxkbcommon' 'libx11' 'libxcursor'
         'libxrandr' 'libxi' 'dbus' 'ffmpeg' 'curl' 'gpu-screen-recorder' 'hicolor-icon-theme')
optdepends=('libnotify: notifications with buttons when a clip is saved'
            'xdg-desktop-portal: file dialogs'
            'zenity: file dialogs without a portal')
provides=('lapse')
conflicts=('lapse' 'lapse-git')
options=('!strip' '!debug')
source=("https://github.com/canersin/Lapse/releases/download/v${pkgver}/Lapse-${pkgver}-x86_64.tar.gz")
sha256sums=('a65f5ba6472e2361c09c6cff5e2e3e14dda8c235583785e767597ee85bb360e1')

package() {
    cd "Lapse-${pkgver}-x86_64"
    install -Dm755 lapse "${pkgdir}/usr/bin/lapse"
    install -Dm644 lapse.desktop "${pkgdir}/usr/share/applications/lapse.desktop"
    install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/lapse.png"
    install -Dm644 lapse.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lapse.svg"
    install -Dm644 lapse-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/lapse-symbolic.svg"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
