# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: RogueGirl <3a33oxx40 at mozmail dot com>
# Contributor: Laurent OF Fough

pkgname=iptvnator-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="Cross-platform IPTV player application with support for M3U/M3U8 playlists, EPG, favorites, TV archive and more."
arch=('x86_64')
url="https://github.com/4gray/iptvnator"
license=('MIT')

depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify'
  'libappindicator-gtk3'
)
provides=('iptvnator')
conflicts=('iptvnator')
options=(!strip)
source=("iptvnator-${pkgver}.pacman::https://github.com/4gray/iptvnator/releases/download/v${pkgver}/iptvnator-${pkgver}-linux-x64.pacman")
sha256sums=('25f57c4829310777c5441ca47b2f563bf31000d0a3b007308d58807031ae10f9')

package() {
  bsdtar -xf "${srcdir}/iptvnator-${pkgver}.pacman" -C "${pkgdir}"
  install -Dm644 "${srcdir}/opt/IPTVnator/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -f "${pkgdir}/.INSTALL" \
        "${pkgdir}/.MTREE" \
        "${pkgdir}/.PKGINFO"
}

# vim:set ts=2 sw=2 et:
