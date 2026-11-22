# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=wayscrollshot-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="A scrolling screenshot tool for Wayland"
arch=('x86_64')
url="https://github.com/jswysnemc/wayscrollshot"
license=('MIT')
depends=('gcc-libs' 'glibc' 'grim' 'libxkbcommon' 'opencv' 'slurp')
optdepends=(
    'wl-clipboard: copy screenshots to the Wayland clipboard'
    'xclip: X11 clipboard fallback'
)
provides=("wayscrollshot=${pkgver}")
conflicts=('wayscrollshot' 'wayscrollshot-git')
source=("wayscrollshot-bin-0.1.10.tar.gz::${url}/releases/download/v${pkgver}/wayscrollshot-archlinux-x86_64.tar.gz")
sha256sums=('67c40a3964dc97c215712d721049907f9bb537cb3212bbeb9ee7f10178f59416')

package() {
    install -Dm755 wayscrollshot "${pkgdir}/usr/bin/wayscrollshot"
    install -d "${pkgdir}/usr/share/applications"
    cat >"${pkgdir}/usr/share/applications/wayscrollshot.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=wayscrollshot
GenericName=Scrolling Screenshot
Comment=Capture and stitch scrolling screenshots on Wayland
Exec=wayscrollshot
Terminal=false
NoDisplay=true
Categories=Graphics;
X-KDE-DBUS-Restricted-Interfaces=org.kde.KWin.ScreenShot2
DESKTOP
}
