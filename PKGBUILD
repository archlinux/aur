# Maintainer: dvjn <git@dvjn.dev>
pkgname=ears-bin
pkgver=0.5.0 # x-release-please-version
pkgrel=1
pkgdesc="Voice dictation: press a hotkey, speak, and ears types what you said"
arch=('x86_64')
url="https://github.com/dvjn/ears"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'alsa-lib')
optdepends=(
    'pipewire-pulse: pick a microphone by name (or a PulseAudio server)'
    'grim: screen text as context on wlroots compositors'
    'xdg-desktop-portal: screen text as context on other desktops'
    'ears-stt: local speech-to-text server'
    'ears-llm: local clean-up language model server'
)
provides=('ears')
conflicts=('ears')
options=('!debug')
install=ears-bin.install
source=("ears_${pkgver}_amd64.deb::$url/releases/download/v$pkgver/ears_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/dvjn/ears/v$pkgver/LICENSE")
sha256sums=('0afc48dc869d303419d798f941d6b6c9d0870ff5a8f14386e22e95e3a373b9dc'
            '8130265ac5f616e5ea648f8f93e2f8c332f90fb95ab898fe9175367abac2daf7')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
