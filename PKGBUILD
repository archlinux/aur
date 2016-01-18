_npmname=svgo
_npmver=0.6.1
pkgname=nodejs-svgo # All lowercase
pkgver=${_npmver}
pkgrel=1
pkgdesc="Nodejs-based tool for optimizing SVG vector graphics files."
arch=(any)
url="https://github.com/svg/svgo"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('e0f3941275791040cbeb0fac1e2f73df4eef10a9eff2ae74848f9f83ec0febf3')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
