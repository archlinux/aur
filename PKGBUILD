# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>

pkgname=ionic-cli
pkgver=6.18.1
pkgrel=1
pkgdesc="The Ionic command line interface (CLI) is your go-to tool for developing Ionic apps"
arch=(any)
url="https://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/@ionic/cli/-/cli-$pkgver.tgz)
noextract=(cli-$pkgver.tgz)
sha256sums=('20d58791d91c335a36666e395d95e15c850b7b6837f7ffcdc5a0c04e64d02868')

package() {
  cd "$srcdir"

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/cli-$pkgver.tgz
}
