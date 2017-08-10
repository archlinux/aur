# Maintainer: Daniel Maslowski <info@orangecms.org>

_npmname=nodemcu-tool
_npmver=2.1.1
pkgname=$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Upload/Download Lua files to your ESP8266 module with NodeMCU firmware"
arch=(any)
url="https://www.npmjs.com/package/nodemcu-tool"
license=('MIT')
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('0a3fd91a9716ecb3d5d09238615a1a77848355ff626be5fb313a2f263e2ffbf9')

package() {
  cd "$srcdir/package"
  /usr/bin/npm install
  mkdir -p "$pkgdir/usr/share"
  cp -a . "$pkgdir/usr/share/nodemcu-tool"
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/nodemcu-tool/bin/nodemcu-tool.js "$pkgdir/usr/bin/nodemcu-tool"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
