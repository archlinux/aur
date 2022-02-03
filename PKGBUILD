# Maintainer:   Sian1468 <setthawut DOT a AT protonmail DOT com>
# Contributor:  Ronan Pigott <rpigott@berkeley.edu>

pkgname='mpv-discordrpc'
pkgver=1.4.1_UNKNOWN
_releasever=${pkgver//_/-}
pkgrel=2
pkgdesc='Discord Rich Presence integration for mpv Media Player'
url='https://github.com/cniw/mpv-discordRPC'
arch=('any')
license=('MIT')
depends=('mpv>=0.34.1' 'discord-rpc')
source=("$url/releases/download/v$_releasever/$pkgname-$_releasever-linux.zip")
sha256sums=('336d17ecd414c1df150eede032a80bc473d334bae7e6e74706eb43c1323651fe')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/etc/mpv/scripts/mpv-discordRPC/
  mkdir -p ${pkgdir}/etc/mpv/script-opts/
  install -Dm644 "status-line.lua" "${pkgdir}/etc/mpv/scripts/"
  install -Dm644 "mpv_discordRPC.conf" "${pkgdir}/etc/mpv/script-opts/"
  install -Dm644 "mpv-discordRPC/lua-discordRPC.lua" "${pkgdir}/etc/mpv/scripts/mpv-discordRPC/"
  install -Dm644 "mpv-discordRPC/catalogs.lua" "${pkgdir}/etc/mpv/scripts/mpv-discordRPC/"
  install -Dm644 "mpv-discordRPC/main.lua" "${pkgdir}/etc/mpv/scripts/mpv-discordRPC/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
