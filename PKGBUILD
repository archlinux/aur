# Maintainer: asafelobotomy <https://github.com/asafelobotomy>
pkgname=romforge-bin
pkgver=0.22.1
pkgrel=1
pkgdesc="Identify, tidy and play your ROM collection"
arch=('x86_64')
url="https://github.com/asafelobotomy/romforge"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'libsoup3' 'cairo' 'gdk-pixbuf2' 'dbus'
         'hicolor-icon-theme' 'glibc' 'libgcc' 'systemd-libs' 'libayatana-appindicator')
optdepends=('retroarch: play games (with its cores)'
            'libretro-scummvm: ScummVM games in RetroArch'
            'scummvm: ScummVM games, and naming them'
            'mame: Arcade, FM-7 and FM Towns games'
            'flatpak: DOSBox Staging or DOSBox-X from Flathub'
            'gtk-layer-shell: the radial menu over a fullscreen game'
            'gst-plugins-good: music in the fullscreen mode (MP3, FLAC, WAV)'
            'gst-libav: music in M4A/AAC'
            'uq: your games in look=see>do_ on uQ, its game-mode window rule and its theme')
provides=('romforge')
conflicts=('romforge')
source=("$pkgname-$pkgver.deb::https://github.com/asafelobotomy/romforge/releases/download/v$pkgver/romforge_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/asafelobotomy/romforge/v$pkgver/LICENSE")
sha256sums=('a1843c21d6ca749f82bf0fff10f6cd0261913b8db54b6bbadc3b669f55af96b3'
            'b96b5a0ecb11e311dab94d71fe36add411fd2110b624d336a6e54cc74aba3e4b')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
