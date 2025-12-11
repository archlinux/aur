# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: RogueGirl <3a33oxx40 at mozmail dot com>
# Contributor: Laurent OF Fough

pkgname=iptvnator-bin
pkgver=0.17.0
pkgrel=1
epoch=1
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
source=("iptvnator-${pkgver}.pacman::https://github.com/4gray/iptvnator/releases/download/test-8d5537370ebf2f95d84122b2351763c2d3ef9579/iptvnator-${pkgver}-linux-x64.pacman")
sha256sums=('d7ab5a9490f8b3cfb8a58babbbba63ccd1590f99463c842b16d23a5c45b1d7ea')

package() {
  bsdtar -xf "${srcdir}/iptvnator-${pkgver}.pacman" -C "${pkgdir}"
  install -Dm644 "${srcdir}/opt/IPTVnator/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -f "${pkgdir}/.INSTALL" \
        "${pkgdir}/.MTREE" \
        "${pkgdir}/.PKGINFO"
}

# vim:set ts=2 sw=2 et:
