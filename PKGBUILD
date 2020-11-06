# Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=webpack-cli
pkgname=nodejs-webpack-cli
pkgver=4.2.0
pkgrel=1
pkgdesc="CLI for webpack & friends"
arch=(any)
url="https://github.com/webpack/webpack-cli#readme"
license=(MIT)
depends=('nodejs')
optdepends=('nodejs-webpack')
makedepends=('npm')
options=(!strip)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        https://raw.githubusercontent.com/webpack/$_npmname/webpack-cli@$pkgver/LICENSE)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('09ca2de6deee939a4a2f8edf206a776caafb6fe3590ed1a8310a3e3b69ad4a18'
            '2af12ca8b612a22e6659ae68e0e59ee7ac792718c45524a989b512c49c5f5879')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
  install -Dm755 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
