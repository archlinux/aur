# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=nodejs-cross-seed
pkgver=6.2.1
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
sha512sums=('93b3038f63e7bbb8a57caa6cef2819735bdab28a3a0e20b30b921b83e8258cf87f041303c52e20bb70f0c8ef2b8544d79dccc7681f1b352a9ec56d4e040455aa')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" ${_npmname}@${pkgver}
  chown -R root:root "${pkgdir}"
}
