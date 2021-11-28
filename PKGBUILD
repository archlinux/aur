pkgname=nodejs-webpack-dev-server
pkgver=4.6.0
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=('MIT')
depends=('nodejs' 'npm' )
source=(http://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-$pkgver.tgz)
noextract=(${npmname#nodejs-}-$pkgver.tgz)
sha512sums=('a288dc0482afc7761aeeab35fc05561c38263f55e697cac6b040674a86f153f509497d713f518f337330b009c3cefa9c5665648bcb55ee56dcb231239343ed62')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/node_modules/
  cd $pkgdir/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir/usr" ${pkgname#nodejs-}@$pkgver
}
