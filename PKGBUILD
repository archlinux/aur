# Maintainer: Lauri Niskanen <ape@ape3000.com>

_npmname=ipscend
pkgname=nodejs-ipscend
pkgver=0.2.0
pkgrel=1
pkgdesc="Quick and simple deploy tool to host Native Web Applications and Static Web Pages in IPFS"
arch=(any)
url="https://github.com/diasdavid/ipscend"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('b7015df9c3ba759a79f6439a670d5c460377047d')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
