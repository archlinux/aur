# Maintainer Cookie Engineer <@cookiengineer>

_npmname=fx
_npmver=14.1.0
pkgname=nodejs-fx # All lowercase
pkgver=14.1.0
pkgrel=1
pkgdesc="Command-line JSON processing tool"
arch=(any)
url=https://github.com/antonmedv/fx
license=( "MIT" )
depends=('nodejs')
makedepends=('npm')
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

