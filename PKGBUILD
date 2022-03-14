# Maintainer: csicar <aur@csicar.de>
# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>
_npmname=spago
_npmver=0.20.7
pkgname=nodejs-spago
pkgver=0.20.7
pkgrel=1
pkgdesc="PureScript package manager and build tool powered by Dhall and package-sets"
arch=(any)
url="https://github.com/spacchetti/spago"
license=(MIT)
depends=('nodejs' 'npm' 'purescript' 'ncurses5-compat-libs')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('1c43f239da94d3ac295056690fd89e4cc053ced4513f6c753c6392b65191d397')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
