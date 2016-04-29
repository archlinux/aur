# Maintainer : Immae <ismael.bouya@normalesup.org>

_npmname=npm-cache
pkgname=nodejs-$_npmname
pkgver=0.6.3
pkgrel=1
pkgdesc="A command line utility that caches dependencies installed via npm."
arch=('any')
url="https://github.com/swarajban/npm-cache"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('1f7b7964477a59392c6b2d9a6d4a7194e307f286bed5819c36927aedfaf92bcd')
options=('!emptydirs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
