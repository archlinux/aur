# Maintainer: Can Altıparmak (gulaghad) <can6dev <AT> gmail <DOT> com>

pkgname=gfxtablet
_pkgname=GfxTablet
pkgver=1.4
pkgrel=1
pkgdesc="Android app to control a virtual Network Tablet on Linux"
arch=('x86_64')
url="http://github.com/rfc2822/GfxTablet"
license=('MIT')
provides=('gfxtablet-git')
replaces=('gfxtablet-git')
conflicts=('gfxtablet-git')
depends=('xf86-input-evdev')
source=("https://github.com/rfc2822/${_pkgname}/releases/download/android-app-${pkgver}/networktablet"
        '99-uinput.rules')
md5sums=('990fb1a0e020e1f9ca17d5d6b8cf9fc7'
         '38b5c44b17429f384a00d625b4019d7e')
install="${pkgname}.install"

package() {
	install -Dm755 "$srcdir/networktablet" "$pkgdir/usr/bin/networktablet"
	install -Dm644 "$srcdir/99-uinput.rules" "$pkgdir/etc/udev/rules.d/99-uinput.rules"
}
