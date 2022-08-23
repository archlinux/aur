# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=4.3.4
pkgname=nodejs-cross-seed # All lowercase
pkgver=4.3.4
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
sha512sums=('709ebf4fdedd94f95d64fe464e928a4181356cfde239ab53b74e8e8ee009b7db658870cc44af72a331c051222af719953114be65545a46cb5bc16c3a6c360ee8')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
