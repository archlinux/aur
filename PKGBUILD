# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=nodejs-servor
_npmpkgname=servor
pkgver=2.2.1
pkgrel=1
pkgdesc="A close to the metal and dependency free server for single page app development"
arch=('any')
url='https://www.npmjs.com/package/servor'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmpkgname/-/$_npmpkgname-$pkgver.tgz")
noextract=("$_npmpkgname-$pkgver.tgz")
md5sums=('f1771dc301865d4e705c2c7b3b245ada')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmpkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${_npmpkgname}"
	ln -s "/usr/lib/node_modules/${_npmpkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_npmpkgname}/"
}
