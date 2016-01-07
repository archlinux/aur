# Maintainer : Immae <ismael.bouya@normalesup.org>

_npmname=npm-cache
pkgname=nodejs-$_npmname
pkgver=0.4.13
pkgrel=1
pkgdesc="A command line utility that caches dependencies installed via npm."
arch=('any')
url="http://gruntjs.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('5d555bf800e656226fa113b60d7266d78206f0e3b773ada793d2b8a1f5a3eb6a')
options=('!emptydirs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
