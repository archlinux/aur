_pkgbase=serve
pkgname=nodejs-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=11.2.0
pkgrel=1
arch=('any')
url='https://github.com/zeit/serve'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_pkgbase/-/$_pkgbase-$pkgver.tgz)
noextract=($_pkgbase-$pkgver.tgz)
sha512sums=('4c765c2f30c6937bc9aa38406cb90b6a0e37b6213757407bc157bdf17b65fb52b202cafee224a183ef6191ee292d99ab089bb4a548344eb6e126676a9ff30aa0')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_pkgbase-$pkgver.tgz
  rm -fr "$pkgdir"/usr/etc

  # Fix npm derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}

