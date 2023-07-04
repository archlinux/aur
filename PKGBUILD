# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=5.3.1
pkgname=nodejs-cross-seed # All lowercase
pkgver=5.3.1
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
sha512sums=('1ca7e5a541f8e35f15735ba7f98e1a446203aa7216074bb33183a7f5027e1a32b78445741bbc4d64462cbe40bf023b9a7da21308b24f2764a26018aa9e1aea83')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
