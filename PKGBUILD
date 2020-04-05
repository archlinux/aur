# Maintainer : Philipp Claßen <philipp.classen@posteo.de>
_npmname=@ionic/cli
_npmver=6.4.1
pkgname=nodejs-ionic-cli
pkgver=$_npmver
pkgrel=1
pkgdesc="The Ionic command-line interface (CLI) for developing Ionic apps."
arch=(any)
url="https://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/@ionic/cli/-/cli-$_npmver.tgz)
sha256sums=('74723265027e413bd0924da62de8284b10fb8be05d59ca9329bb20a9b8b8025d')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chmod -R g-w "$pkgdir/usr"
  chown -R root:root "$pkgdir/usr"
}
