# Maintainer: Daniel Maslowski <info@orangecms.org>

_npmname=nodemcu-tool
_npmver=3.2.1
pkgname=$_npmname
pkgver=$_npmver
pkgrel=3
pkgdesc="Upload/Download Lua files to your ESP8266 module with NodeMCU firmware"
arch=(any)
url="https://www.npmjs.com/package/nodemcu-tool"
license=('MIT')
depends=('nodejs>=8' 'npm' 'python2')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('5e1ddfd566dca10fa42c8017587b1b0f94acbec4f2d07edd9e243798d9ad9a83')

package() {
  cd "$srcdir/package"
  /usr/bin/npm install
  /usr/bin/npm rebuild
  mkdir -p "$pkgdir/usr/share"
  cp -r . "$pkgdir/usr/share/nodemcu-tool"
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/nodemcu-tool/bin/nodemcu-tool.js "$pkgdir/usr/bin/nodemcu-tool"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
