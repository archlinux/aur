_npmname=have-it
pkgname=nodejs-$_npmname
pkgver=1.11.1
pkgrel=1
pkgdesc="The fastest NPM install does nothing because you already have it"
arch=(any)
url="https://github.com/bahmutov/have-it"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('840a1585960dfc2d4a18b1fed437929cd18111075b23fcbfa00822a6279edae9')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
