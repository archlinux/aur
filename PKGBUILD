# Maintainer: Mina Nagy Zaki <mnzaki@gmail.com>

_npmname=markmap-cli
pkgname=nodejs-markmap-cli # All lowercase
pkgver=0.14.3
pkgrel=1
pkgdesc="Create markmaps (mindmaps from markdown) from CLI"
arch=(any)
url="https://github.com/gera2ld/markmap/packages/markmap-cli#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(7d860f66794de7337b21ee8d36241ec5be92be03)

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
	chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
