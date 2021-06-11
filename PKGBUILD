pkgname=nodejs-webpack-dev-server
pkgver=3.11.2
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=('MIT')
depends=('nodejs' 'npm' )
source=(http://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-$pkgver.tgz)
noextract=(${npmname#nodejs-}-$pkgver.tgz)
sha512sums=('03cd0192e1d141f0a236d1814b510c7f60a14d4b34c7e077c060c598e793e2b9893878474c21f69da37120786692bd3f5229653f8537c9e232bf5a4da7e4032d')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/node_modules/
  cd $pkgdir/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir/usr" ${pkgname#nodejs-}@$pkgver
}
