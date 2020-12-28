# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=eslint-plugin-vue
pkgver=7.4.0
pkgrel=1
pkgdesc='ESLint Plugin for Vue.js'
arch=('any')
url='https://github.com/vuejs/eslint-plugin-vue'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
md5sums=('05c97697784db7c06b9beec2e0b7c573')
noextract=($pkgname-$pkgver.tgz)

package() {
	npm install --verbose -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
