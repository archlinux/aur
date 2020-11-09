# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=eslint-plugin-vue
pkgver=7.1.0
pkgrel=1
pkgdesc='ESLint Plugin for Vue.js'
arch=('any')
url='https://github.com/vuejs/eslint-plugin-vue'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
md5sums=('6c5a3f99efffe1390194abf49f24b55b')
noextract=($pkgname-$pkgver.tgz)

package() {
	npm install --verbose -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
