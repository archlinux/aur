# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=babel-eslint
pkgver=9.0.0
pkgrel=1
pkgdesc='Custom parser for ESLint'
arch=('any')
url='https://github.com/babel/babel-eslint'
license=('MIT')
depends=('nodejs' 'eslint')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
md5sums=('d3378ac787ebe8143255db94cd1202b6')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
