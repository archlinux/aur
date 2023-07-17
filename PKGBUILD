# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=5.4.0
pkgname=nodejs-cross-seed # All lowercase
pkgver=5.4.0
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
sha512sums=('3538027db3de06311a92c785f26f413fb5c276d2ee542b29ca1a4a3bbd949b28eb107e5f8c32194c7189dba8a7486a28e3ca9869e5dd16085aa95ee90caf0126')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
