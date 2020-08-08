_name=hexo-cli
pkgname=nodejs-$_name
pkgver=4.2.0
pkgrel=1
pkgdesc="Command line interface for Hexo: a fast, simple & powerful blog framework."
arch=('any')
url="https://hexo.io"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-hexo')
noextract=($_name-$pkgver.tgz)
source=(https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz)
sha1sums=('74647bc72a90b9cebf04af5bc70839ab281a305d')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_name@$pkgver
}
