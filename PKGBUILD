# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=4.4.2
pkgname=nodejs-cross-seed # All lowercase
pkgver=4.4.2
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
sha512sums=('25da0dc6f4be35b6eb9cb1a5f403f1c8b7142f4db1c42b582e7dbd077dcf787a8e503dcd6ebd3c41379510e85a0961e66ac1ff457aaad2d60dfa35e6723900f8')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
