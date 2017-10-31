# Maintainer: jakob <grandchild@gmx.net>

pkgname=autohidewibox
pkgver=0.5
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
	'012d7636f2659e60d24cbd49980e96ef4c74ebf6'
	'55a4fc3d53aa456e979b411384dcaf9a0535f4bb'
)

package() {
	cd $srcdir/
	install -d $pkgdir/usr/bin
	install -Dm755 ${pkgname}.py $pkgdir/usr/bin/
	install -d $pkgdir/etc
	install -Dm644 ${pkgname}.conf $pkgdir/etc/
}
