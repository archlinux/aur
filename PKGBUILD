# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=babel-eslint
pkgver=10.0.1
pkgrel=1
pkgdesc="A wrapper for Babel's parser used for ESLint"
arch=('any')
url='https://github.com/babel/babel-eslint'
license=('MIT')
depends=('nodejs' 'eslint>=4.12.1')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
md5sums=('7dae7c500c41a8e0ff7cb44a2b86cc22')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
