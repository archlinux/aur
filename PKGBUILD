# Maintainer Cookie Engineer <@cookiengineer>

_npmname=fx
_npmver=18.0.0
pkgname=nodejs-fx
pkgver=18.0.0
pkgrel=1
pkgdesc="Command-line JSON processing tool"
arch=(any)
url=https://github.com/antonmedv/fx
license=( "MIT" )
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('b7afc9c8ad0849f62050722f13aab5528197df1689680305e11d9db99aeb9718')
noextract=($_npmname-$_npmver.tgz)

package() {
	cd "$srcdir";
	local _npmdir="$pkgdir/usr/lib/node_modules/";
	mkdir -p "$_npmdir";
	cd "$_npmdir";
	npm install --user root -g --prefix "$pkgdir/usr" --ignore-scripts "$_npmname@$_npmver";
}

