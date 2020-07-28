_name=hexo-cli
pkgname=nodejs-$_name
pkgver=4.0.0
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
sha1sums=('bb963f36238681043be203e8a57cb0c95f9ac163')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_name@$pkgver
}
