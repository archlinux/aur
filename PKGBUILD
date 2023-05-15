# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=5.0.1
pkgname=nodejs-cross-seed # All lowercase
pkgver=5.0.1
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
sha512sums=('21e96637f885889525b195dc88862ba40f8508902cc9e6fdde51a05ce0c26954bd26a3acda4f6fd76c3b6cfd3b0ac691fc75706e84be01c845a770750fe3ba8a')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
