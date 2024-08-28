# Maintainer: VlaDexa (Vladislav Grechannik) <vgrechannik@gmail.com>
_pkgname='thumbfast'
pkgname="mpv-${_pkgname}-osc-git"
pkgdesc="${_pkgname}s fork of the default osc for MPV"
pkgver=r226.5fefc9b
pkgrel=1
arch=('any')
url='https://github.com/po5/thumbfast'
makedepends=('mpv' 'git')
source=("git+${url}.git#branch=vanilla-osc")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 "player/lua/osc.lua" -t "${pkgdir}/etc/mpv/scripts/"
}
