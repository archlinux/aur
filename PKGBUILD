# Maintainer: itlxrd <ilyakm@icloud.com>
pkgname=psysonic-bin
pkgver=1.29.0
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers (Navidrome, Gonic, etc.) (pre-built binary)"
arch=('x86_64')
url="https://github.com/Psychotoxical/psysonic"
license=('GPL-3.0-only')
provides=('psysonic')
conflicts=('psysonic')
depends=(
    'alsa-lib'
    'gtk3'
    'openssl'
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
)
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/Psychotoxical/psysonic/releases/download/app-v${pkgver}/Psysonic_${pkgver}_amd64.deb")
sha256sums_x86_64=('d739eea5cb054314ee38587c1462e3065e52c9f63175bd48b3ab27d7ea77f803')

package() {
    cd "$srcdir"
    ar x "${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir"
}
