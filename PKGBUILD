# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com 
_npmname=tldr
_npmver=1.0.0
pkgname=nodejs-tldr # All lowercase
pkgver=1.0.0
pkgrel=1
pkgdesc="Simplified and community-driven man pages"
arch=(any)
url="https://github.com/rprieto/tldr"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
md5sums=('d1aa41ecf73c40c4b9c9fa6024123e89')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
