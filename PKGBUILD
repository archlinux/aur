# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=webpack-cli
pkgname=nodejs-webpack-cli
pkgver=3.3.6
pkgrel=1
pkgdesc="CLI for webpack & friends"
arch=(any)
url="https://github.com/webpack/webpack-cli#readme"
license=(MIT)
depends=('nodejs')
optdepends=('nodejs-webpack')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('47207c706a847af464ff2d9d43bf2de77bb7c79c7083f5d2827aaa93b17871aa')

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
