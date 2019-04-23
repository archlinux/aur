# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=degit
pkgver=2.1.3
pkgrel=1
pkgdesc="Straightforward project scaffolding"
arch=('any')
url='https://github.com/Rich-Harris/degit'
license=('MIT')
depends=('nodejs>=8')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('834663796525bcb46f77ecf61cb3454c81650098dd7b2c0c66b1584ab821ddd4')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
