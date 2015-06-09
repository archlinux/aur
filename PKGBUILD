_npmname=sweet.js
_npmver=0.7.4
pkgname=nodejs-sweet # All lowercase
pkgver=0.7.4
pkgrel=1
pkgdesc="Hygienic Macros for JavaScript"
arch=(any)
url="https://github.com/mozilla/sweet.js"
license=( "BSD" )
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('6ad0a39a8d2f0280325e951d5df7cbd5399a3135')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
