_npmname=sweet.js
_npmver=3.0.15
pkgname=nodejs-sweet # All lowercase
pkgver=3.0.15
pkgrel=1
pkgdesc="Hygienic Macros for JavaScript"
arch=(any)
url="https://github.com/mozilla/sweet.js"
license=( "BSD" )
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('afdee2d87faf6f6472ba7eab688920c98a4fc3b63c91c438e97ace8c1346ab38')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
