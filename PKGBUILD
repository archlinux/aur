# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Mark Pustjens <pustjens at dds dot nl>

_npmname=express
pkgname=nodejs-$_npmname
pkgver=4.14.0
pkgrel=1
pkgdesc="Fast, unopinionated, minimalist web framework."
arch=('any')
url="http://expressjs.com"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('e21c61034b8d836ca5d68de4b3365012548e8c57af4a6047026b21797efd8c80')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
