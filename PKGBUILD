# Maintainer : Immae <ismael.bouya@normalesup.org>

_npmname=npm-cache
pkgname=nodejs-$_npmname
pkgver=0.7.0
pkgrel=1
pkgdesc="A command line utility that caches dependencies installed via npm."
arch=('any')
url="https://github.com/swarajban/npm-cache"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha512sums=('2cc2f53dcdb42634053b93e39cda7ca1713bfb389e41546cf65c86135e13b8462ae662963bacf602784c242d102e0d9c6eb258a51aaad04fc0a567d7bc18d8f5')
options=('!emptydirs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
