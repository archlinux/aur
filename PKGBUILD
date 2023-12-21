# Maintainer: Eduardo Parra Mazuecos<eduparra90@gmail.com>

pkgname=nodejs-socket-cli-js
_npmname=@socketsecurity/cli
pkgver=0.9.0
pkgrel=1
pkgdesc="The Socket CLI tool"
arch=("any")
url="https://github.com/SocketDev/${pkgname#nodejs-}/"
license=("MIT")
depends=("nodejs" "unzip")
makedepends=("npm")
source=(https://registry.npmjs.org/$_npmname/-/cli-${pkgver}.tgz)
noextract=("${pkgname}-${pkgver}.tgz")
sha1sums=("23093a1b227deaccc973fad36d446db98c1845f9")
sha256sums=("f16679ef7260d0ca5a6f7da86b966952c34da1baf943e0a97af9cb76828fcc10")

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
