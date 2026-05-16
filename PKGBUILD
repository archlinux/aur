# Maintainer: kenura-krag <kenura.gunarathna@thenex.global>
pkgname=campus-lms-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Desktop Moodle LMS client (Pre-compiled Binary version)"
arch=('x86_64')
url="https://github.com/Kenura-R-Gunarathna/campus-lms"
license=('MIT')
depends=(
    'libxkbcommon'
    'libgl'
    'dbus'
    'libsecret'
    'openssl'
    'wayland'
)
provides=('campus-lms')
conflicts=('campus-lms')
source=(
    "campus-lms::${url}/releases/download/v${pkgver}/campus-lms-linux-x86_64"
    "campus-lms.desktop"
    "campus-lms-daemon.service"
    "campus-lms.png"
)
sha256sums=(
    '7b65cc2ed5f43cd2a64feebce2f0d1a2fcbfc7a8f571aed67f033544bb383a0b'
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "${srcdir}/campus-lms" \
        "${pkgdir}/usr/bin/campus-lms"

    install -Dm644 "${srcdir}/campus-lms.desktop" \
        "${pkgdir}/usr/share/applications/campus-lms.desktop"

    install -Dm644 "${srcdir}/campus-lms-daemon.service" \
        "${pkgdir}/usr/lib/systemd/user/campus-lms-daemon.service"

    install -Dm644 "${srcdir}/campus-lms.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/campus-lms.png"
}
