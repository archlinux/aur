# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=rollup
pkgver=0.56.3
pkgrel=1
pkgdesc="Next-generation ES6 module bundler"
arch=(any)
url="https://github.com/rollup/rollup"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  rmdir "$pkgdir/usr/etc"
}

sha256sums=('13308a99f80ceaa918f2cb7298f784db49ebd99aff2231453faca0618cdd9e36')
