# Maintainer: Jan Okoński <jandominikokonski@gmail.com>

pkgname=tidal-cli-client # All lowercase
_pkgname=${pkgname#nodejs-}
pkgver=1.4.7
pkgrel=1
pkgdesc='You can now use Tidal on linux. With your loved CLI. <3'
arch=(any)
license=(MIT)
url='https://github.com/okonek/tidal-cli-client'
depends=('nodejs' 'npm' 'mpv' 'w3m')
optdepends=()
source=(http://registry.npmjs.org/tidal-cli-client/-/tidal-cli-client-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=(53ab106202f445790818050b39ea9df2df96a215)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$_pkgver
}
