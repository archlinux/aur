pkgname=nodejs-webpack-dev-server
pkgver=3.1.9
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=('MIT')
depends=('nodejs' 'npm' )
source=(http://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-$pkgver.tgz)
noextract=(${npmname#nodejs-}-$pkgver.tgz)
sha512sums=('7ea3e4b8d6a52ee73f8510b640c91560992036646fc59428ef2900d9ed57460fed3099b7a98ed9683e9df3dfc5aa3c6d8fd6ceae7e706732c3da7f3894976f5a')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/node_modules/
  cd $pkgdir/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir/usr" ${pkgname#nodejs-}@$pkgver
}
