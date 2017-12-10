pkgname=nodejs-webpack-dev-server
pkgver=2.9.7
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=('MIT')
depends=('nodejs' 'npm' )
source=(http://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-$pkgver.tgz)
noextract=(${npmname#nodejs-}-$pkgver.tgz)
sha512sums=('3eeeeea10160423e51139c2695f929612ce284c2b1ba5c04b8edb10ac68c9c09f2452029c28562dc1f160a6f576e28325931da20ccd81a407dd15afa95e01e4d')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/node_modules/
  cd $pkgdir/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir/usr" ${pkgname#nodejs-}@$pkgver
}
