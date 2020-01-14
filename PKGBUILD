# Maintainer Cookie Engineer <@cookiengineer>

_npmname=nexe
_npmver="4.0.0-beta.3"

pkgname=nodejs-nexe
pkgver=4.0.0_beta.3
pkgrel=1
pkgdesc="Create a single executable out of your Node.js application"
arch=(any)
url=https://github.com/nexe/nexe
license=( "MIT" )
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('23b0927d70fe9f2c15f8b5c506e89a35f8b61ba5d8f71aa58485997f09c40501')
noextract=($_npmname-$_npmver.tgz)

package() {
	cd "$srcdir";
	local _npmdir="$pkgdir/usr/lib/node_modules/";
	mkdir -p "$_npmdir";
	cd "$_npmdir";
	npm install --user root -g --prefix "$pkgdir/usr" --ignore-scripts "$_npmname@$_npmver";
}

