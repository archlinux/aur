# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Mark Pustjens <pustjens at dds dot nl>

_npmname=express
pkgname=nodejs-$_npmname
pkgver=4.13.0
pkgrel=1
pkgdesc="Fast, unopinionated, minimalist web framework."
arch=('any')
url="http://expressjs.com"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('5b6d3a0e1a251ed3f211fb8295943d0264c6c71668b8505697d80378811333de')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
