# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=nodejs-cross-seed
pkgver=5.8.7
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
sha512sums=('0c3cb3bc81e912c3f3f70b75424e01628bc718301630283b26e1c525589a881e76fa1d41dd629a137db607d5d32c7eca03398e38b8c936d87f4519324d42e142')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" ${_npmname}@${pkgver}
  chown -R root:root "${pkgdir}"
}
