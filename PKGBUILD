_pkgbase=serve
pkgname=npm-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=6.4.9
pkgrel=1
arch=('any')
url='https://github.com/zeit/serve'
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_pkgbase/-/$_pkgbase-$pkgver.tgz)
noextract=($_pkgbase-$pkgver.tgz)
sha512sums=('c063ddda081cfefd4f5cbfe0cf73f4a3cfe33eec65c0af593124fc0236416d8cdd54f4c82f7742ace16b310a8c9add26f7a8a65fbd7fbf25c847496430db4084')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_pkgbase-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc

  # Fix npm derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}

