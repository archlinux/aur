# Maintainer: Colin Reeder <colin AT reederhome DOT net>
pkgname=aclidswitch-git
_pkgname=aclidswitch
pkgdesc='Simple Power Management tool'
pkgrel=1
pkgver=0
arch=('any')
license=('GPL2')
depends=('xorg-xbacklight' 'xorg-xset')
backup=("etc/default/$_pkgname")
makedepends=('git')
url="https://github.com/orschiro/$_pkgname"
source=("git+https://github.com/orschiro/$_pkgname")
md5sums=('SKIP')

package() {
	install -Dm644 "$srcdir/$_pkgname/default/aclidswitch" "$pkgdir/etc/default/aclidswitch"
	install -Dm644 "$srcdir/$_pkgname/98-aclidswitch.rules" "$pkgdir/usr/lib/udev/rules.d/98-aclidswitch.rules"
	install -Dm644 "$srcdir/$_pkgname/99-low-battery-action.rules" "$pkgdir/usr/lib/udev/rules.d/99-low-battery-action.rules"
	install -Dm755 "$srcdir/$_pkgname/aclidswitch" "$pkgdir/usr/bin/aclidswitch"
}
