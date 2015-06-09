# Maintainer: jakob <grandchild@gmx.net>

pkgname=autohidewibox
pkgver=0.3
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
	'd35b5a86ccd8eaf38e4e9a6cb0facc6368f167f3'
	'413629a2f3b83d18b807954429fbf7348136e753'
)

package() {
	cd $srcdir/
	install -d $pkgdir/usr/bin
	install -Dm755 ${pkgname}.py $pkgdir/usr/bin/
	install -d $pkgdir/etc
	install -Dm644 ${pkgname}.conf $pkgdir/etc/
}
