# Maintainer:   selpast <selpast@pm.me>

pkgname='mpv-discordrpc-git'
pkgver=1.4.1.UNKNOWN.r5.gc8270e5
pkgrel=1
pkgdesc='Discord Rich Presence integration for mpv Media Player'
url='https://github.com/cniw/mpv-discordRPC'
arch=('any')
license=('MIT')
depends=('discord-rpc')
source=(git+${url}.git)
sha256sums=(SKIP)
pkgver() {
    cd mpv-discordRPC
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/mpv-discordRPC
  mkdir -p ${pkgdir}/etc/mpv/scripts/mpv-discordRPC/
  mkdir -p ${pkgdir}/etc/mpv/script-opts/
  install -Dm644 "status-line.lua" "${pkgdir}/etc/mpv/scripts/"
  install -Dm644 "mpv_discordRPC.conf" "${pkgdir}/etc/mpv/script-opts/"
  install -Dm644 "mpv-discordRPC/lua-discordRPC.lua" "${pkgdir}/etc/mpv/scripts/mpv-discordRPC/"
  install -Dm644 "mpv-discordRPC/catalogs.lua" "${pkgdir}/etc/mpv/scripts/mpv-discordRPC/"
  install -Dm644 "mpv-discordRPC/main.lua" "${pkgdir}/etc/mpv/scripts/mpv-discordRPC/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
