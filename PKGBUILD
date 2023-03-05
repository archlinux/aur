# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=4.4.1
pkgname=nodejs-cross-seed # All lowercase
pkgver=4.4.1
pkgrel=1
pkgdesc="Download torrents that you can cross seed based on your existing torrents."
arch=(any)
url='https://github.com/mmgoodnow/cross-seed'
license=('Apache 2.0')
depends=('nodejs' 'npm')
optdepends=(
  'qbittorrent'
  'rtorrent'
)
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('1df9c73a4469cc1871183cb4c13175c30abba0579f063c239b2a8c101e620f7c7eb8e0b6ba727555a77eb6034a0f83c967d11ef918e198377606c22e30dcbbec')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
