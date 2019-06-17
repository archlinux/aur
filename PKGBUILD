# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=babel-eslint
pkgver=10.0.2
pkgrel=1
pkgdesc="A wrapper for Babel's parser used for ESLint"
arch=('any')
url='https://github.com/babel/babel-eslint'
license=('MIT')
depends=('nodejs' 'eslint>=4.12.1')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
md5sums=('3b79766c09bf7604efd34584c111698a')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
