# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>

pkgname=ionic-cli
pkgver=6.13.1
pkgrel=1
pkgdesc="The Ionic command line interface (CLI) is your go-to tool for developing Ionic apps"
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/@ionic/cli/-/cli-$pkgver.tgz)
noextract=(cli-$pkgver.tgz)
sha256sums=('47c3a9bd407d85b5743caa95c3fac15635003a75bcd7c50579de613434f519fe')

package() {
  cd "$srcdir"

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/cli-$pkgver.tgz
}
