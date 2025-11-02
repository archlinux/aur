# Maintainer: Gustavo Vinícios de Souza <gnsfujiwara@disroot.org>

_npmname=xdccjs
_npmver=5.4.11
pkgname=nodejs-xdccjs
pkgver=5.4.11
pkgrel=1
pkgdesc="download files from XDCC bots on IRC, complete implementation of the XDCC protocol"
arch=('any')
url="https://github.com/JiPaix/xdccJS"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha1sums=('6c32e8a421cdfd0d026d1b4cf366700ad3945762')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$_npmname@$_npmver"
  chown -R root:root "$pkgdir"
}
