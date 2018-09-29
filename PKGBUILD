pkgname=nodejs-solid-server
pkgver=4.1.4
pkgrel=1
pkgdesc="Solid server on top of the file-system"
arch=(any)
url="http://github.com/solid/node-solid-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-$pkgver.tgz)
noextract=(${npmname#nodejs-}-$pkgver.tgz)
sha512sums=('6277acd05a1133f3998be55c29617dfd86eccb504e1a86b2f3ef09fe6e5c8d2bc71f1824948226a60db569e439d4d9529f0d8becc388ecff129962ea9e1e537d')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" $srcdir/${pkgname#nodejs-}-$pkgver.tgz
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
