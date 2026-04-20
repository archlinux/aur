pkgname=lazyspotify-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal Spotify client bundled with a patched go-librespot daemon"
arch=('x86_64')
url="https://github.com/dubeyKartikay/lazyspotify"
license=('MIT' 'GPL3')
depends=('alsa-lib' 'flac' 'glibc' 'libogg' 'libvorbis')
optdepends=(
  'gnome-keyring: Secret Service keyring provider'
  'keepassxc: Secret Service keyring provider'
  'kwallet: Secret Service keyring provider'
  'wl-clipboard: clipboard integration on Wayland'
  'xclip: clipboard integration on X11'
  'xsel: clipboard integration on X11'
)
source=("lazyspotify-v${pkgver}-arch-amd64.tar.gz::https://github.com/dubeyKartikay/lazyspotify/releases/download/v0.4.0/lazyspotify-v0.4.0-arch-amd64.tar.gz")
sha256sums=('0de13a738480288c08ca1f0536f9d5e1cb010c566323cb71623278613f7eafce')

package() {
  install -Dm755 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/lazyspotify" "${pkgdir}/usr/bin/lazyspotify"
  install -Dm755 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/lazyspotify-librespot" "${pkgdir}/usr/lib/lazyspotify/lazyspotify-librespot"
  install -Dm644 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/LICENSE.go-librespot" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.go-librespot"
  install -Dm644 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
