# Maintainer: Jan Okoński <jandominikokonski@gmail.com>

pkgname=tidal-cli-client # All lowercase
_pkgname=${pkgname#nodejs-}
pkgver=1.4.5
pkgrel=1
pkgdesc='You can now use Tidal on linux. With your loved CLI. <3'
arch=(any)
license=(MIT)
url='https://github.com/okonek/tidal-cli-client'
depends=('nodejs' 'npm' 'mpv' 'w3m')
optdepends=()
source=(http://registry.npmjs.org/tidal-cli-client/-/tidal-cli-client-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=(a0c0b1089ab4eea3f937551d7f9228b650d32ba7)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$_pkgver
}
