_npmname=svgo
_npmver=0.5.6
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
sha1sums=(9501c533cf84f74a79be1bb3f3494d912bbed119)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
