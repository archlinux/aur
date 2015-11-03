# Maintainer : Immae <ismael.bouya@normalesup.org>

_npmname=npm-cache
pkgname=nodejs-$_npmname
pkgver=0.3.7
pkgrel=1
pkgdesc="A command line utility that caches dependencies installed via npm."
arch=('any')
url="http://gruntjs.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('760e27c4e8737e82461ad0b4e54f3dbeb95f33a5d66a8e240bdb68bb488b5701')
options=('!emptydirs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
