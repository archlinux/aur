# Maintainer: jakob <grandchild@gmx.net>

pkgname=autohidewibox
pkgver=0.4
pkgrel=1
pkgdesc="Show awesome WM wibox only on ModKey press"
url=https://github.com/grandchild/${pkgname}
#install=${pkgname}.install
changelog=.Changelog
arch=('i686' 'x86_64')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('python' 'xorg-xinput')
source=(
	"https://raw.githubusercontent.com/grandchild/${pkgname}/${pkgver}/${pkgname}.py"
	"https://raw.githubusercontent.com/grandchild/${pkgname}/${pkgver}/${pkgname}.conf"
)
sha1sums=(
	'87c3aa94779356048b7cae7f4ade12ee43e7ad75'
	'e6892a5a1952faa2cc48ed6950f91481ddb914ce'
)

package() {
	cd $srcdir/
	install -d $pkgdir/usr/bin
	install -Dm755 ${pkgname}.py $pkgdir/usr/bin/
	install -d $pkgdir/etc
	install -Dm644 ${pkgname}.conf $pkgdir/etc/
}
