# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=nodejs-cross-seed
pkgver=5.4.3
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
sha512sums=('017bdb21b0aa7f68f467ef3d4c97e9d796bc99391594f7bdf577b27a076a6fecc44f3aa45ccddb3aa0f3fc58a51fad3a1495b9f575aad318686f8dd0c8f79048')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" ${_npmname}@${pkgver}
  chown -R root:root "${pkgdir}"
}
