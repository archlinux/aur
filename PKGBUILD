# Maintainer: csicar <aur@csicar.de>
# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>
_npmname=spago
_npmver=0.21.0
pkgname=nodejs-spago
pkgver=0.21.0
pkgrel=1
pkgdesc="PureScript package manager and build tool powered by Dhall and package-sets"
arch=(any)
url="https://github.com/spacchetti/spago"
license=(MIT)
depends=('nodejs' 'npm' 'purescript' 'ncurses5-compat-libs')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('ec7fe685bab3a9a045e6ac51c0427cd07133a96bf3370d3e719434d3d223f85b')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
