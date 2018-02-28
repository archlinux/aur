# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=eslint-plugin-vue
pkgver=4.3.0
pkgrel=1
pkgdesc='ESLint Plugin for Vue.js'
arch=('any')
url='https://github.com/vuejs/eslint-plugin-vue'
license=('MIT')
depends=('nodejs' 'eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('ce3b968076f310f617d5313e96242517')

package() {
  	npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
	rm -r "$pkgdir"/usr/etc

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
