# Maintainer Cookie Engineer <@cookiengineer>

_npmname=fx
_npmver=9.0.2
pkgname=nodejs-fx # All lowercase
pkgver=9.0.2
pkgrel=1
pkgdesc="Command-line JSON processing tool"
arch=(any)
url=https://github.com/antonmedv/fx
license=( "MIT" )
depends=('nodejs')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('SKIP')
noextract=($_npmname-$_npmver.tgz)

package() {
	cd "$srcdir";
	local _npmdir="$pkgdir/usr/lib/node_modules/";
	mkdir -p "$_npmdir";
	cd "$_npmdir";
	npm install --user root -g --prefix "$pkgdir/usr" --ignore-scripts "$_npmname@$_npmver";
}

