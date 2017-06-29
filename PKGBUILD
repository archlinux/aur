_npmname=hexo-cli
_npmver=1.0.3

pkgname=nodejs-hexo-cli
pkgver=1.0.3
pkgrel=1
pkgdesc="Command line interface for Hexo: a fast, simple & powerful blog framework."
arch=('any')
url="https://hexo.io"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-hexo')
noextract=($_npmname-$pkgver.tgz)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha1sums=('8ebcae88cac29254f1e9ac07f8a9f07399a8a1ae')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
