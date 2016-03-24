# Maintainer: juantascon

_npmname=Haraka
_npmver=2.8.0-alpha.7
pkgname=haraka
pkgver=2.8.0_alpha.7
pkgrel=1
pkgdesc="A node.js mail server"
arch=(any)
url="http://haraka.github.io/"
license=("MIT")
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('c8e874e7b77a1048f4afd57f9463b4cf717a0d92')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
