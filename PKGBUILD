_npmname=cordova-check-plugins
pkgname=nodejs-$_npmname
pkgver=4.0.5
pkgrel=1
pkgdesc="A CLI tool to check for / manage plugin updates in Cordova/Phonegap projects."
arch=('any')
url="https://github.com/dpa99c/cordova-check-plugins"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz)
noextract=($_npmname-${pkgver//_/-}.tgz)
sha1sums=('0ac568ac8a842ee0481ccadab594c0dfe69b8851')
options=("!strip")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@${pkgver//_/-}
}
