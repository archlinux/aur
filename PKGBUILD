# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>
_author=olrtg
pkgname=emmet-language-server
pkgver=2.4.0
pkgrel=1
pkgdesc="A language server for emmet.io"
arch=("any")
url="https://www.npmjs.com/package/@$_author/$pkgname"
license=('MIT')
depends=("nodejs")
makedepends=("npm")
noextract=("$pkgname-$pkgver.tgz")
source=("https://registry.npmjs.org/@$_author/$pkgname/-/${pkgname}-${pkgver}.tgz")
sha256sums=('8c1bdfbe618c51172eecdad245d58c7a8f35c17afc7aa4fe04058bf05d5af0bf')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir && cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" "@${_author}/${pkgname}@${pkgver}"
	chown -R root:root "$pkgdir"
}
