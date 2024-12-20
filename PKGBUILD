# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=nodejs-cross-seed
pkgver=6.4.1
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
sha512sums=('4a153ce9e47b8db6986dcd7ad7ca17e2e4c1449a18ac66d4ba8089d3abe726b8ecb0e0b1a265990c3e58e52d1b4648352e5fab250c417d05b9d6499818328cb8')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" ${_npmname}@${pkgver}
  chown -R root:root "${pkgdir}"
}
