# Maintainer: creations <creations@creations.works>
pkgname=grabit-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Screenshot, screen-recording, OCR, and uploader for wlroots and KDE Plasma 6 Wayland compositors (prebuilt binary)"
arch=('x86_64')
url="https://heliopolis.live/creations/grabit"
license=('AGPL-3.0-or-later')
depends=(
    'cairo'
    'curl'
    'dbus'
    'file'
    'json-c'
    'libxkbcommon'
    'wayland'
)
optdepends=(
    'ffmpeg: --record support'
    'tesseract: --tesseract (OCR) support'
    'tesseract-data-eng: english OCR data'
    'translate-shell: --translate (OCR -> translated text) support'
    'libjpeg-turbo: JPEG output (--format jpeg)'
    'libwebp: WebP output (--format webp)'
    'pipewire: pw-play (default shutter-sound player)'
    'libpulse: paplay (alternative sound player)'
    'alsa-utils: aplay (alternative sound player)'
    'sox: play (alternative sound player)'
)
provides=("grabit=${pkgver}")
conflicts=('grabit' 'grabit-git')
source=("LICENSE-${pkgver}::https://heliopolis.live/creations/grabit/raw/tag/${pkgver}/LICENSE")
source_x86_64=("grabit-${pkgver}-x86_64::https://heliopolis.live/creations/grabit/releases/download/${pkgver}/grabit-x86_64-linux")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('d057de25cd5a70a75912a5955daf0104e4d34bbeb22d1a28a18b48b76ae8721b')

package() {
    install -Dm755 "grabit-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/grabit"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
