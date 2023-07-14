# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>
_author=olrtg
pkgname=emmet-language-server
pkgver=2.0.1
pkgrel=1
pkgdesc="A language server for emmet.io"
arch=("any")
url="https://www.npmjs.com/package/@$_author/$pkgname"
license=('MIT')
depends=("nodejs")
makedepends=("npm")
noextract=("$pkgname-$pkgver.tgz")
source=("https://registry.npmjs.org/@$_author/$pkgname/-/${pkgname}-${pkgver}.tgz")
sha256sums=('2bb76cfc5718dd78369a3e7e5e1501c41c4d7cafa2692a83edec3eea7a31127d')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir && cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" "@${_author}/${pkgname}@${pkgver}"
	chown -R root:root "$pkgdir"
}
