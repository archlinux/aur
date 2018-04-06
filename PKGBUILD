# Maintainer: Jan Okoński <jandominikokonski@gmail.com>

pkgname=tidal-cli-client # All lowercase
_pkgname=${pkgname#nodejs-}
pkgver=1.4.2
pkgrel=1
arch=(any)
license=(MIT)
depends=('nodejs' 'npm' 'mpv' 'w3m')
optdepends=()
source=(http://registry.npmjs.org/tidal-cli-client/-/tidal-cli-client-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha1sums=(d37aca22094a39cffdb517e1b03708126a533776)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$_pkgver
}
