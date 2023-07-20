# Maintainer: Mina Nagy Zaki <mnzaki@gmail.com>

_npmname=markmap-cli
pkgname=nodejs-markmap-cli # All lowercase
pkgver=0.15.2
pkgrel=1
pkgdesc="Create markmaps (mindmaps from markdown) from CLI"
arch=(any)
url="https://github.com/gera2ld/markmap/packages/markmap-cli#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('dae33ea2f8994aebccb5e6e07baf72f7571217d7')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
	chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
