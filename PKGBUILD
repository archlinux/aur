# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_npmname=observatory-cli
_npmver=0.7.1
pkgname=nodejs-observatory-cli
pkgver=0.7.1
pkgrel=1
pkgdesc="Observatory by Mozilla CLI Client"
arch=(any)
url="https://github.com/mozilla/observatory-cli"
license=(MPL2)
depends=('nodejs' )
optdepends=()
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('fb7f1d1cee6289c57300f92d75cb9f0b30c558f3')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
