# Maintainer: Felix Golatofski <contact@xdfr.de>

_npmname=pxder
pkgname=nodejs-pxder # All lowercase
pkgver=2.8.6
pkgrel=1
pkgdesc="Download illusts from pixiv.net P站插画批量下载器"
arch=(any)
url="https://github.com/Tsuk1ko/pxder#readme"
license=(GPL-3.0-or-later)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ac5b96a9c0909c3771913300e4999a3663e83c8f1c2aa11d3f40fdca78c9f449')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
