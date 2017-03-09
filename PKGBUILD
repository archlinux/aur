_npmname=webpack-dev-server
_npmver=2.4.1
pkgname=nodejs-webpack-dev-server # All lowercase
pkgver=2.4.1
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('fbd31db17fbddb115b1a0d576761bb7829c4584dd5b239f5308f80932d893890dc1b0e87394f973370ae84513b7ee5bf14939a17d849bfd18cbd1ced8889d4f2')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
