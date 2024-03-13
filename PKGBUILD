# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>
_author=olrtg
pkgname=emmet-language-server
pkgver=2.5.0
pkgrel=2
pkgdesc="A language server for emmet.io"
arch=("any")
url="https://www.npmjs.com/package/@$_author/$pkgname"
license=('MIT')
depends=("nodejs")
makedepends=("npm")
noextract=("$pkgname-$pkgver.tgz")
source=("https://registry.npmjs.org/@$_author/$pkgname/-/${pkgname}-${pkgver}.tgz")
sha256sums=('5d236e0f9bacd6a7a65fd08319276701b4ae7869f08523882af459d9ecae261a')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir && cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" "@${_author}/${pkgname}@${pkgver}"
	chown -R root:root "$pkgdir"

	install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
