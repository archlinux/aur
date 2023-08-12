# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>
_author=olrtg
pkgname=emmet-language-server
pkgver=2.1.0
pkgrel=1
pkgdesc="A language server for emmet.io"
arch=("any")
url="https://www.npmjs.com/package/@$_author/$pkgname"
license=('MIT')
depends=("nodejs")
makedepends=("npm")
noextract=("$pkgname-$pkgver.tgz")
source=("https://registry.npmjs.org/@$_author/$pkgname/-/${pkgname}-${pkgver}.tgz")
sha256sums=('31b105905e1a4855fcfd5e15d47c0a7c84c6129f894602cf900a6d55feef6e1f')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir && cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" "@${_author}/${pkgname}@${pkgver}"
	chown -R root:root "$pkgdir"
}
