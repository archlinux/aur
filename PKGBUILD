# Maintainer: Eduardo Parra Mazuecos<eduparra90@gmail.com>

pkgname=nodejs-socket-cli-js
_npmname=@socketsecurity/cli
pkgver=0.6.0
pkgrel=1
pkgdesc="The Socket CLI tool"
arch=("any")
url="https://github.com/SocketDev/${pkgname#nodejs-}/"
license=("MIT")
depends=("nodejs" "unzip")
makedepends=("npm")
source=(https://registry.npmjs.org/$_npmname/-/cli-${pkgver}.tgz)
noextract=("${pkgname}-${pkgver}.tgz")
sha1sums=("75cf6dd238c9bc257127fef383c1dccf9f21706d")
sha256sums=("5ffbb47becb083ad4f04baf6266cc62745dcc44a9b585adbad117f98be44aba5")

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
