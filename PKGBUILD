# Maintainer: Jan Okoński <jandominikokonski@gmail.com>

pkgname=tidal-cli-client
_pkgname=${pkgname#nodejs-}
pkgver=1.5.1
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
sha1sums=(01b6f1f443caf8e32353a6346fbe7fdaf3b6eb9e)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$_pkgver
}
