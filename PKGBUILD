# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=4.4.0
pkgname=nodejs-cross-seed # All lowercase
pkgver=4.4.0
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
sha512sums=('6ab66eac82e5eaedc481477f9ebe1ede6c97e78131bc7783b82abce5f5e988aade89e0b3647a17ac95609d9384b8550e35c0ed7c48182a406bca0aa509572501')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
