# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=broken-link-checker
_npmver=0.7.8
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Find broken links, missing images, etc in your HTML."
arch=('i686' 'x86_64')
url="https://github.com/stevenvachon/broken-link-checker"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
provides=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" $_npmname@$_npmver
  chmod -R 755 $_npmdir$_npmname
}
sha512sums=('ff31f8fe72cc34a0de0c7e6756e7ff47a5987746239daaf536971d00edbe565c2318acc96bacb8d82d3750efa2981487c1ee8179f4a4562f367c8984d916fbca')
