# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com 
_npmname=tldr
_npmver=1.0.1
pkgname=nodejs-tldr # All lowercase
pkgver=1.0.1
pkgrel=1
pkgdesc="Simplified and community-driven man pages"
arch=(any)
url="https://github.com/rprieto/tldr"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('54c9c762020d96aa62c2e55d629314f691c5b95d')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
