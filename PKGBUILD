# Maintainer: Christos Paloukas <christos@paloukas.com>
pkgname=k6-studio-bin
_pkgver=1.4.0
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop application to help generate k6 test scripts (binary release)"
arch=('x86_64')
url="https://github.com/grafana/k6-studio"
license=('AGPL-3.0')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'libxtst'
    'xdg-utils'
    'at-spi2-core'
    'libdrm'
    'mesa'
    'libxcb'
    'trash-cli'
    'gvfs'
    'glib2'
    'alsa-lib'
)
optdepends=(
    'pulseaudio: for PulseAudio sound server support (recommended by original package)'
    'pipewire-pulse: for sound server support via PipeWire (modern alternative to pulseaudio)'
    'libgnome-keyring: for storing secrets in GNOME Keyring (suggested by original package)'
    'lsb-release: for providing Linux Standard Base distribution information (suggested by original package)'
)
source=("https://github.com/grafana/k6-studio/releases/download/v${_pkgver}/k6-studio_${_pkgver}_amd64.deb")
sha256sums=('a0850e06d1cad414f423ea426246c735c257fc3c768ef146fff6b54ab72b98e2')

prepare() {
    cd "$srcdir"
    ar x "k6-studio_${_pkgver}_amd64.deb"
}

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.zst -C "$pkgdir/"
}