# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>

pkgname=ionic-cli
pkgver=6.17.0
pkgrel=1
pkgdesc="The Ionic command line interface (CLI) is your go-to tool for developing Ionic apps"
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/@ionic/cli/-/cli-$pkgver.tgz)
noextract=(cli-$pkgver.tgz)
sha256sums=('0c9f05ea60d37e2724445b736562f860c39f1c9c4683077e146408483861f558')

package() {
  cd "$srcdir"

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/cli-$pkgver.tgz
}
