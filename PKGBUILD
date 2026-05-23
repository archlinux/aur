pkgname=lazyspotify-bin
pkgver=0.5.1
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
source=("lazyspotify-v${pkgver}-arch-amd64.tar.gz::https://github.com/dubeyKartikay/lazyspotify/releases/download/v0.5.1/lazyspotify-v0.5.1-arch-amd64.tar.gz")
sha256sums=('65b9f6a2a1d6b7b592f8feefc3843781c543db78ec9811c67df5851a216a08ea')

package() {
  install -Dm755 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/lazyspotify" "${pkgdir}/usr/bin/lazyspotify"
  install -Dm755 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/lazyspotify-librespot" "${pkgdir}/usr/lib/lazyspotify/lazyspotify-librespot"
  install -Dm644 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/LICENSE.go-librespot" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.go-librespot"
  install -Dm644 "${srcdir}/lazyspotify-v${pkgver}-arch-amd64/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
