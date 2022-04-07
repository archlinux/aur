# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgrel=1
pkgver=6.2.r.55
_pkgbase=dwm
pkgname=auto-dwm
pkgdesc="Concise Build of Suckless DWM"
arch=('x86_64')
url="https://gitlab.com/a4to/dwm"
license=('MIT')
depends=('libxft')
optdepends=(
    'xorg-xrandr: Allows for changing the resolution of the screen'
    'xwallpaper:  Allows for setting a wallpaper'
    'lxappearance: Allows for changing the theme of the window manager'
    'xorg-xsetroot: Allows for changing the background color of the bar and WM'
    'xorg-xbacklight: Allows for changing the brightness of the screen'
  )
provides=(dwm)
conflicts=(dwm)
backup=(usr/bin/dwm.bak)
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('0ab35c87c8d53a61ddcaf481203a9e968485e5cd24ee236762cfb69d35c70d11')

build() {
	NAME="${pkgname}" make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	NAME="${pkgname}" make PREFIX=/usr DESTDIR="${pkgdir}" clean install
}
