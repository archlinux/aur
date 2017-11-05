# Maintainer: jakob <grandchild@gmx.net>

pkgname=autohidewibox
pkgver=0.6
pkgrel=1
pkgdesc="Show awesome WM wibox only on ModKey press"
url=https://github.com/grandchild/${pkgname}
#install=${pkgname}.install
changelog=.Changelog
license=('CC0')
arch=('i686' 'x86_64')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('awesome' 'python' 'xorg-xinput')
source=(
	"https://raw.githubusercontent.com/grandchild/${pkgname}/${pkgver}/${pkgname}.py"
	"https://raw.githubusercontent.com/grandchild/${pkgname}/${pkgver}/${pkgname}.conf"
)
sha1sums=(
	'50e72742868fc3d4d402e3fa5455c3f2924501c8'
	'5b01bbb3f243a24d679af794e051f7eb03aa7647'
)

package() {
	cd $srcdir/
	install -d $pkgdir/usr/bin
	install -Dm755 ${pkgname}.py $pkgdir/usr/bin/
	install -d $pkgdir/etc
	install -Dm644 ${pkgname}.conf $pkgdir/etc/
}
