# Maintainer: Peter Hoeg <first name at last name dot com>

pkgname=('matrix-js-sdk')
pkgver=0.3.0
pkgrel=1
pkgdesc="JS services for implementing the Client-Server API on Matrix"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/${pkgname}"
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matrix-org/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d2a38464234d619523dd780155e5334d')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ${pkgname}@${pkgver}
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
