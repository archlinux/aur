# Maintainer: Daniel Maslowski <info@orangecms.org>

_npmname=nodemcu-tool
_npmver=3.0.2
pkgname=$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Upload/Download Lua files to your ESP8266 module with NodeMCU firmware"
arch=(any)
url="https://www.npmjs.com/package/nodemcu-tool"
license=('MIT')
depends=('nodejs>=8')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('c5fe6378907fab0fd870087eca4d098809e64f5cfe70789eef88cf70a5c886e1')

package() {
  cd "$srcdir/package"
  /usr/bin/npm install
  chmod go-w . -R
  mkdir -p "$pkgdir/usr/share"
  cp -a . "$pkgdir/usr/share/nodemcu-tool"
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/nodemcu-tool/bin/nodemcu-tool.js "$pkgdir/usr/bin/nodemcu-tool"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
