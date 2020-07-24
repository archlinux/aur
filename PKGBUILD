# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: Tom Wizetek <tom@wizetek.com>

pkgname=vlc-tunein-radio
_gitname="TuneIn-Radio-VLC"
pkgver=r34.c3cd86f
pkgrel=1
pkgdesc="TuneIn Radio LUA Script for VLC 2.x"
url="https://github.com/diegofn/TuneIn-Radio-VLC"
license=('custom')
arch=('any')
depends=('vlc' 'git')
source=("git+https://github.com/diegofn/TuneIn-Radio-VLC.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_gitname}
  install -D -m 644 "tunein.lua" "${pkgdir}/usr/lib/vlc/lua/sd/tunein.lua"
  install -D -m 644 "playlist/radiotime.lua" "${pkgdir}/usr/lib/vlc/lua/playlist/radiotime.lua"
  install -D -m 644 "playlist/streamtheworld.lua" "${pkgdir}/usr/lib/vlc/lua/playlist/streamtheworld.lua"
}
