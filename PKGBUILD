# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=nodejs-http-server-spa
_npmpkgname=http-server-spa
pkgver=1.3.0
pkgrel=1
pkgdesc="A small but fast static file server running on node"
arch=('any')
url='https://www.npmjs.com/package/http-server-spa'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmpkgname/-/$_npmpkgname-$pkgver.tgz")
noextract=("$_npmpkgname-$pkgver.tgz")
md5sums=('791dc85ff1efbd6d6dd12b0f6d121b38')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmpkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${_npmpkgname}"
	ln -s "/usr/lib/node_modules/${_npmpkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_npmpkgname}/"
}
