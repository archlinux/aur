_pkgbase=serve
pkgname=nodejs-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=11.3.2
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

sha512sums=('c8a5907c8df16e3fdfed7d654c183dd5f5c13f416a8c9e13122fa29444b9cb31f488a2693792e335bd58cc87d083d46a9f8102512d9239fdbe2a67a9a20a1ae7')
