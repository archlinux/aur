# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>

pkgname=ionic-cli
pkgver=6.18.0
pkgrel=1
pkgdesc="The Ionic command line interface (CLI) is your go-to tool for developing Ionic apps"
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/@ionic/cli/-/cli-$pkgver.tgz)
noextract=(cli-$pkgver.tgz)
sha256sums=('b8bbb0a4961d3f17b2fa28b7be614471d0ff5a3fbe4122504725f893a13bbe8f')

package() {
  cd "$srcdir"

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/cli-$pkgver.tgz
}
