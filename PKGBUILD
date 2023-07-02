# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=5.3.0
pkgname=nodejs-cross-seed # All lowercase
pkgver=5.3.0
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
sha512sums=('e47a9b920f0a4a97ce57dfdf1bb215f6c8b6c5d75019509122e63c706da8439947fda369da8f580140daaaade6b3f4052be42d27d96086f128a092c1bb279ad2')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
