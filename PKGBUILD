# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgrel=1
pkgver=6.3
_pkgname=AutoLinux
pkgname=autolinux
pkgbase=autolinux-git
pkgdesc="A riced spin on Suckless DWM"
arch=('x86_64')
url="https://gitlab.com/a4to/${_pkgname}"
license=('MIT')
depends=('libxft')
makedepends=('git')
optdepends=(
		'xorg-xrandr: Allows for changing the resolution of the screen'
		'xwallpaper:	Allows for setting a wallpaper'
		'lxappearance: Allows for changing the theme of the window manager'
		'xorg-xsetroot: Allows for changing the background color of the bar and WM'
		'xorg-xbacklight: Allows for changing the brightness of the screen'
	)
provides=(AutoLinux)
conflicts=(AutoLinux)
backup=(usr/bin/AutoLinux.bak)
source=("git+$url.git")
md5sums=('SKIP')

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
