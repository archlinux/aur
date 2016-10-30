# Maintainer : Immae <ismael.bouya@normalesup.org>

_npmname=npm-cache
pkgname=nodejs-$_npmname
pkgver=0.6.5
pkgrel=1
pkgdesc="A command line utility that caches dependencies installed via npm."
arch=('any')
url="https://github.com/swarajban/npm-cache"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f11c749242799d1ea498e3c03781f495f0f34e2631d88a7b900f71e3e3b885ee')
options=('!emptydirs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
