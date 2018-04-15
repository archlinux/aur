# Maintainer: Jan Okoński <jandominikokonski@gmail.com>

pkgname=tidal-cli-client
_pkgname=${pkgname#nodejs-}
pkgver=1.5.0
pkgrel=1
pkgdesc='You can now use Tidal on linux. With your loved CLI. <3'
arch=(any)
license=(MIT)
url='https://github.com/okonek/tidal-cli-client'
depends=('nodejs' 'npm' 'mpv' 'w3m')
optdepends=()
makedepend=('git')
source=(http://registry.npmjs.org/tidal-cli-client/-/tidal-cli-client-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=(1183c9de6106bd0be3c8b29c971b5ea727e87dd4)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$_pkgver
}
