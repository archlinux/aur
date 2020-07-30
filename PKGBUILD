_name=hexo-cli
pkgname=nodejs-$_name
pkgver=4.1.0
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
sha1sums=('833b1726550830fbf592dd84ffe2e9d0eba09ca1')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_name@$pkgver
}
