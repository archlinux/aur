# Maintainer: Nathaniel Maia <natemaia10@gmail.com>

pkgname=dk
pkgver=1.2
pkgrel=1
pkgdesc="A tiling window manager in the vein of dwm, bspwm, and xmonad."
url="https://bitbucket.org/natemaia/dk"
arch=('x86_64')
license=('MIT')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
optdepends=('sxhkd: keybind support [recommended]'
			'st: example rc files default terminal'
			'dmenu: example rc files default launcher')
depends=('git' 'xcb-proto' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'xcb-util-cursor')
install="${pkgname}.install"

package()
{
	cd dk/ &&
		make DESTDIR="$pkgdir" PREFIX="/usr" install &&
		install -D -m644 LICENSE $pkgdir/usr/share/licenses/dk/LICENSE
}
