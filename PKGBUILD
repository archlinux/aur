# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=babel-eslint
pkgver=10.0.0
pkgrel=1
pkgdesc="A wrapper for Babel's parser used for ESLint"
arch=('any')
url='https://github.com/babel/babel-eslint'
license=('MIT')
depends=('nodejs' 'eslint>=4.12.1')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
md5sums=('1d6d6975e749a0f0876185b31ecc216a')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
