# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=eslint-plugin-vue
pkgver=5.2.2
pkgrel=1
pkgdesc='ESLint Plugin for Vue.js'
arch=('any')
url='https://github.com/vuejs/eslint-plugin-vue'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('e30739aef7d1b95c97dcbb8a771c925c')

package() {
	npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
