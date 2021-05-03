# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
pkgname=dmscripts-git
_pkgname=dmscripts
pkgver=1.0.r218.3c86c1f
pkgrel=1
pkgdesc="A collection of dmenu scripts"
arch=('any')
url="https://gitlab.com/dwt1/dmscripts.git"
license=('GPL3')
depends=(dmenu ffmpeg findutils xclip xdotool xorg-xrandr bind jq)
groups=()
makedepends=(pandoc git)
checkdepends=()
optdepends=(
  'emacs: editor for dmconf '
  'libnotify: used by dmlogout'
  'maim: used by dmscrot'
  'mpc: used by dm-music'
  'mpd: used by dm-music'
  'qutebrowser: used by dmqute'
  'reddio: used by dmred'
  'zenity: used by dmred'
  'slock: used by dmlogout'
  'sxiv: used by dmwall'
  'xwallpaper: used by dmwall'
  'udisks2: used by dm-usbmount'
  )
provides=(dmscripts)
conflicts=(dmscripts)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${_pkgname}"
  DESTDIR="$pkgdir/" make clean build
}


package() {
  cd ${_pkgname}
  NAME="${pkgname}" DESTDIR="${pkgdir}/" make install
}

