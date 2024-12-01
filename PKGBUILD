# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: RogueGirl <3a33oxx40 at mozmail dot com>
# Contributor: Laurent OF Fough

pkgname=iptvnator-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more."
arch=('x86_64')
url="https://github.com/4gray/iptvnator"
license=('MIT')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
optdepends=(
  'ffmpeg: audio and video libraries'
  'mpv: media player'
  'vlc: media player'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source=("${url}/releases/download/app-v${pkgver}-3/iptvnator-${pkgver}-3-1.${CARCH}.rpm"
        "https://raw.githubusercontent.com/4gray/iptvnator/refs/heads/electron/LICENSE.md")
sha256sums=('3817e366ca1e3ad20666be4c17c6134dfbb17f1eb9d9f17707cf92cc62397d41'
            '475a6c9a7c4fd3157f78c0afa1daab94fb81ff23dd94dad81e0f657ba5259f74')

package() {
  install -dm755 ${pkgdir}/usr
  cp -Pr --no-preserve=ownership ${srcdir}/usr ${pkgdir}
  install -Dm644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
