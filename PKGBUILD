_name=hexo-cli
pkgname=nodejs-$_name
pkgver=3.1.0
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
sha1sums=('a7414d4647333fe73762f86d77e5660659c0d05b')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_name@$pkgver
}
