# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>
_author=olrtg
pkgname=emmet-language-server
pkgver=2.6.0
pkgrel=3
pkgdesc="A language server for emmet.io"
arch=("any")
url="https://www.npmjs.com/package/@$_author/$pkgname"
license=('MIT')
depends=("nodejs")
makedepends=("npm")
noextract=("$pkgname-$pkgver.tgz")
source=("https://registry.npmjs.org/@$_author/$pkgname/-/${pkgname}-${pkgver}.tgz")
sha256sums=('01df7e6c64939edde55e1f61bc1d04ac9b395465ff36d606408e19fe61abfe22')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir && cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" "@${_author}/${pkgname}@${pkgver}"
	chown -R root:root "$pkgdir"

	install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
