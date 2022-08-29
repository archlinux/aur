# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=4.3.6
pkgname=nodejs-cross-seed # All lowercase
pkgver=4.3.6
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
sha512sums=('67af9fefa37d8be01f91a7fb9f6a584c92e9af48cfb743870fee6431fe9d3406d992219ec1595f354d44e761230857f539884e9cda925bd4ba6f1df88b7301ac')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
