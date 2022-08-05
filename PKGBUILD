# Maintainer: Firas Zaidan
pkgname=elm-test
_pkgver=0.19.1
pkgver=${_pkgver}r9
_rev=revision9
pkgrel=2
pkgdesc="Run elm-test suites."
arch=(any)
url="https://github.com/rtfeldman/node-test-runner#readme"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver-$_rev.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=(8da169f1f7bf9e4590ffd1a52954d07a90c51c2e)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$_pkgver-$_rev
}

