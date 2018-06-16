pkgname=uglify-es
pkgver=3.3.9
pkgrel=1
pkgdesc="JavaScript parser, mangler/compressor and beautifier toolkit for ES6+"
arch=('any')
url='http://lisperator.net/uglifyjs'
license=('BSD')
depends=('nodejs')
makedepends=('npm')
conflicts=('uglify-js')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('afe314d2b7efe0bff479e5b7c59addd7ab783597caf0b77849656095805bedecf9b971561ee551b3ac424eb7f5ca2aecf5ae23e18dbb9e7ed245f3babfaed7b1')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/uglify-js/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

  # Fix npm derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}

# vim:set ts=2 sw=2 et:
