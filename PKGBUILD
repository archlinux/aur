# Author: "Cowboy" Ben Alman (http://benalman.com/)
# Contributor: "Cowboy" Ben Alman (http://benalman.com/)
# Contributor: Kyle Robinson Young (http://dontkry.com/)
# Contributor: Tyler Kellen (http://goingslowly.com)
# Contributor: Sindre Sorhus (http://sindresorhus.com)
# Contributor: cowboy <cowboy@rj3.net>
# Contributor: tkellen <tyler@sleekcode.net>
# Contributor: cracoucass14

_npmname=grunt
pkgname=nodejs-grunt # All lowercase
pkgver=1.0.1
pkgrel=2
pkgdesc="The JavaScript Task Runner"
arch=(any)
url="http://gruntjs.com/"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('e8778764e944b18f32bb0f10b9078475c9dfb56b')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
#    rmdir "$pkgdir/usr/etc"
}
