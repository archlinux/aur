# Maintainer: Can Altıparmak (gulaghad) <can6dev <AT> gmail <DOT> com>

pkgname=gfxtablet
_pkgname=GfxTablet
pkgver=1.5
_android_app_ver=1.4
pkgrel=1
pkgdesc="Android app to control a virtual Network Tablet on Linux"
arch=('x86_64')
url="http://github.com/rfc2822/GfxTablet"
license=('MIT')
conflicts=('gfxtablet-git')
depends=('xf86-input-evdev')
source=("https://github.com/rfc2822/${_pkgname}/releases/download/android-app-${_android_app_ver}-linux-driver-${pkgver}/networktablet"
        '99-uinput.rules')
md5sums=('c2e16e38e5dc7cb764aeef6348ed3f89'
         '38b5c44b17429f384a00d625b4019d7e')
install="${pkgname}.install"

package() {
	install -Dm755 "$srcdir/networktablet" "$pkgdir/usr/bin/networktablet"
	install -Dm644 "$srcdir/99-uinput.rules" "$pkgdir/etc/udev/rules.d/99-uinput.rules"
}
