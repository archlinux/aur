# Maintainer: Nathaniel Maia <natemaia10@gmail.com>

pkgname=dk
pkgver=1.4
pkgrel=1
pkgdesc="A tiling window manager in the vein of dwm, bspwm, and xmonad."
url="https://bitbucket.org/natemaia/dk"
arch=('x86_64')
license=('MIT')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
optdepends=(
		'sxhkd: keybind support [recommended]'
		'st: example rc files default terminal'
		'dmenu: example rc files default launcher'
		)
makedepends=('git')
depends=('xcb-proto' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'xcb-util-cursor')
install=dk.install

package()
{
	cd dk/ &&
		make DESTDIR="$pkgdir" PREFIX="/usr" install &&
		install -D -m644 LICENSE $pkgdir/usr/share/licenses/dk/LICENSE
}
