# Maintainer: Gregory Danielson III <gregdan3@protonmail.com>

_npmname=markmap-cli
pkgname=nodejs-markmap-cli # All lowercase
pkgver=0.16.2
pkgrel=1
pkgdesc="Create markmaps (mindmaps from markdown) from CLI"
arch=(any)
url="https://markmap.js.org/"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('d6ff284619c1a330a785743f0b6fdd5feff7f30f')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
	chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
