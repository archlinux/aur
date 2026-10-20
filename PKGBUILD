# Maintainer: dvjn <git@dvjn.dev>
pkgname=ears-bin
pkgver=0.2.0
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
sha256sums=('29ff5297355ebf5d34a1de3abd77fc8529c7a474fd55336ff5b35728f07116fb' '8130265ac5f616e5ea648f8f93e2f8c332f90fb95ab898fe9175367abac2daf7')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
