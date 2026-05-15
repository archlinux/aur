# Maintainer: kenura-krag <kenura.gunarathna@thenex.global>
pkgname=campus-lms-bin
pkgver=0.2.2
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
)
sha256sums=(
    'c74a695fe165ada3ef5eeafb0373859665a39626e2e501a3556064d4b31a89c8'
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
}
