_npmname=hexo-cli
_npmver=1.0.3

pkgname=nodejs-hexo-cli
pkgver=1.0.3
pkgrel=2
pkgdesc="Command line interface for Hexo: a fast, simple & powerful blog framework."
arch=('any')
url="https://hexo.io"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-hexo')
noextract=($_npmname-$pkgver.tgz)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha1sums=('64aa13eda34a0261dc339171e07ad131ef610ac7')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
