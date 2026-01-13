# Maintainer: blitzkriegfc <blitzkriegfc@proton.me>
pkgname=qbz-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Native Qobuz client for Linux with Hi-Fi audio support (pre-built binary)"
arch=('x86_64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'libappindicator-gtk3')
optdepends=(
    'pipewire-alsa: PipeWire audio support'
    'pipewire-pulse: PulseAudio compatibility'
)
provides=('qbz')
conflicts=('qbz')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz_${pkgver}_amd64.tar.gz")
sha256sums=('95029e45c9eb9bef20a289b5a99672cd212fe119de11e93b0be8c9af581cceee')

package() {
    cd "${srcdir}/qbz_${pkgver}_amd64"

    # Install binary
    install -Dm755 "qbz" "${pkgdir}/usr/bin/qbz"

    # Install desktop file
    install -Dm644 "qbz.desktop" "${pkgdir}/usr/share/applications/qbz.desktop"

    # Install icons
    install -Dm644 "icons/hicolor/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/qbz.png"
    install -Dm644 "icons/hicolor/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qbz.png"
}
