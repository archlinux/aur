# Maintainer: Eduardo Parra Mazuecos<eduparra90@gmail.com>

pkgname=nodejs-socket-cli-js
_npmname=@socketsecurity/cli
pkgver=0.5.4
pkgrel=1
pkgdesc="The Socket CLI tool"
arch=("any")
url="https://github.com/SocketDev/${pkgname#nodejs-}/"
license=("MIT")
depends=("nodejs" "unzip")
makedepends=("npm")
source=(https://registry.npmjs.org/$_npmname/-/cli-${pkgver}.tgz)
noextract=("${pkgname}-${pkgver}.tgz")
sha1sums=("26e91a805a93438575263f3e264f4048ff5348d7")
sha256sums=("bcbae04509a310781af44be0389bb2fe42585b05a82025ef1993cecc366e8870")

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
