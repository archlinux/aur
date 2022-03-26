# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>

pkgname=ionic-cli
pkgver=6.19.0
pkgrel=1
pkgdesc="The Ionic command line interface (CLI) is your go-to tool for developing Ionic apps"
arch=(any)
url="https://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/@ionic/cli/-/cli-$pkgver.tgz)
noextract=(cli-$pkgver.tgz)
sha256sums=('38bc960d48d491c5f485a60cce0c8d16989c231a979aa36f97ae788905048630')

package() {
  cd "$srcdir"

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/cli-$pkgver.tgz
}
