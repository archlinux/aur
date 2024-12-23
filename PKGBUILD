# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=nodejs-cross-seed
pkgver=6.5.2
_npmname=cross-seed
pkgrel=1
pkgdesc="Download torrents to cross seed based on your existing torrents."
arch=(any)
url='https://github.com/mmgoodnow/cross-seed'
license=('Apache 2.0')
depends=('nodejs' 'npm')
optdepends=(
  'qbittorrent'
  'rtorrent'
)
source=(http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz)
noextract=(${_npmname}-${pkgver}.tgz)
sha512sums=('d9278c2c1a736bc209d42f567fbf7d79b3f7d906a315836e8f8d96d64bfbd519112ffb9e37a5590c6a3d762a640efefe011d080f2c1b8ef73d831ae24f17850b')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" ${_npmname}@${pkgver}
  chown -R root:root "${pkgdir}"
}
