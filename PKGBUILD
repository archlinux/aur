# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=rollup
pkgver=0.56.0
pkgrel=1
pkgdesc="Next-generation ES6 module bundler"
arch=(any)
url="https://github.com/rollup/rollup"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  rmdir "$pkgdir/usr/etc"
}

sha1sums=('4aefe9cef84a01ac3245e3fbba155e38dc2cc2e8')
