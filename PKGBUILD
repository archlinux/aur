# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgrel=1
pkgver=1.0
_baseame=dwm
pkgname=dwm-nu1ll1nux
pkgdesc="Concise Build of Suckless DWM"
arch=('x86_64')
url="https://gitlab.com/qYp/dwm"
license=('MIT')
depends=(gcc xorg-server xorg-xinit libxft-bgra-git)
makedepends=(git coreutils)
optdepends=(
    'xorg-xrandr: Allows for changing the resolution of the screen'
    'xwallpaper:  Allows for setting a wallpaper'
    'lxappearance: Allows for changing the theme of the window manager'
    'xorg-xsetroot: Allows for changing the background color of the bar and WM'
    'xorg-xbacklight: Allows for changing the brightness of the screen'
  )
provides=(dwm)
conflicts=(dwm)
replaces=(dwm)
backup=(usr/bin/dwm.bak)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${_basename}"
  printf "1.0.""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_basename}"
  DESTDIR="$pkgdir" make
}

package() {
  cd "${_basename}"
  NAME="${pkgname}" DESTDIR="${pkgdir}" make clean install
}

