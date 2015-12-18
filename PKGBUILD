# Maintainer : Immae <ismael.bouya@normalesup.org>

_npmname=npm-cache
pkgname=nodejs-$_npmname
pkgver=0.4.12
pkgrel=1
pkgdesc="A command line utility that caches dependencies installed via npm."
arch=('any')
url="http://gruntjs.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('e357185e9a7c015e53a1afebcb4fa5d0517511e27bdd9727526ea320ad7298e3')
options=('!emptydirs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
