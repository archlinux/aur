# Maintainer: Trent Palmer trenttdually at gmail
# Previous Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com
_npmname=tern
_npmver=0.24.0
pkgname=nodejs-tern # All lowercase
pkgver=0.24.0
pkgrel=1
pkgdesc="A JavaScript code analyzer for deep, cross-editor language support"
arch=(any)
url='http://ternjs.net/'
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('55060fbc852d5a6f84140490736980686eebcf1770243bb66a114419faaaea2e82a4d9c1e39e0a0ca5a9ccc6d90c88f3f7e088139143ac5b0461c8e2cbb698ad')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
