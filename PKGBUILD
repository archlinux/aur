# Maintainer: Aaron Coach <aur at ezpz dot cz>

_npmname=passport
_npmver=0.5.3
pkgname=nodejs-passport
pkgver=0.5.3
pkgrel=1
pkgdesc="Passport is Express-compatible authentication middleware for Node.js."
arch=(any)
url="https://www.passportjs.org/"
license=(MIT)
makedepends=('npm')
depends=('nodejs<=18.15.0')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('161b6eb9f49d2cff23ae16b6123a4b686cb8f30927d8cb4d92c1e1e142fe6532')

package() {
	cd "$srcdir"
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
