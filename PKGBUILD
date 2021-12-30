pkgname=nodejs-webpack-dev-server
pkgver=4.7.2
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=('MIT')
depends=('nodejs' 'npm' )
source=(http://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-$pkgver.tgz)
noextract=(${npmname#nodejs-}-$pkgver.tgz)
sha512sums=('b3ac843927cfa41ea0d53dbe0b964e52de5c40e3218c8f7c2159a6bcc35be5c762a87a314947c0088487a94ff0672faae1aaff03d8d6d296cd8fbb1ae745d154')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/node_modules/
  cd $pkgdir/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir/usr" ${pkgname#nodejs-}@$pkgver
}
