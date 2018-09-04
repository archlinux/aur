# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=webpack
pkgname=nodejs-webpack
pkgver=4.17.2
pkgrel=1
pkgdesc="JavaScript bundler (CommonJs, AMD, ES6 modules, CSS, Images, JSON, CoffeeScript, LESS)"
arch=(any)
url="https://webpack.js.org/"
license=(MIT)
depends=('nodejs')
optdepends=()
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('272d6b3dde4498a4f4b3613ec117ea037594f51b30af6597873892ade332101c')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
  install -Dm755 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
