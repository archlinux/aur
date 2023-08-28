# Maintainer: Donald Webster <fryfrog@gmail.com>

_npmname=cross-seed
_npmver=5.4.1
pkgname=nodejs-cross-seed # All lowercase
pkgver=5.4.1
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
sha512sums=('95e77d32cc5dd31d19c8af805a32fe282227540834c655b45b16d5376576e93be58f29d17261ae8fc50e27526a49d487311aebc5309d6b5800f05527e534b8b0')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
