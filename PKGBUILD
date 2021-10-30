_pkgbase=serve
pkgname=nodejs-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=12.0.1
pkgrel=1
arch=('any')
url='https://github.com/zeit/serve'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_pkgbase/-/$_pkgbase-$pkgver.tgz)
noextract=($_pkgbase-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_pkgbase-$pkgver.tgz
  rm -fr "$pkgdir"/usr/etc

  # Fix npm derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}

sha512sums=('090e2290ba7183fc2634cef28afba5a52e9f863462146e8e8e63fcb72dff7354819d2936ddfa4a98b015e076e84c0d8aad986450f9437e30e19d19808d0e4f87')
