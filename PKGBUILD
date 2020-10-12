# Maintainer: Felix Golatofski <contact@xdfr.de>

_npmname=pxder
pkgname=nodejs-pxder # All lowercase
pkgver=2.11.1
pkgrel=1
pkgdesc="Download illusts from pixiv.net P站插画批量下载器"
arch=(any)
url="https://github.com/Tsuk1ko/pxder"
license=(GPL-3.0-or-later)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('5f5c769c7fbe5b53f5242042df57fd44aa8c7f80fbe8a9177a96d7d61b335d53')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
