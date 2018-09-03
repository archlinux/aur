# Maintainer: Jan Okoński <jandominikokonski@gmail.com>

pkgname=tidal-cli-client-git
_pkgname=tidal-cli-client
pkgver=2.0.5
pkgrel=1
pkgdesc='You can now use Tidal on linux. With your loved CLI. <3'
arch=(any)
license=(MIT)
url='https://github.com/okonek/tidal-cli-client'
depends=('nodejs' 'npm' 'mpv' 'w3m')
optdepends=()
makedepends=('git')
source=(http://registry.npmjs.org/tidal-cli-client/-/tidal-cli-client-$pkgver.tgz)
noextract=(tidal-cli-client-$pkgver.tgz)
sha1sums=(a558ac60578f297615821c8e1019d627446ca125)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" tidal-cli-client@$_pkgver
}

