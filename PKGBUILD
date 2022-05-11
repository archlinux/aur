pkgname=autorest
pkgver=3.6.1
pkgrel=1
pkgdesc='The AutoRest tool generates client libraries for accessing RESTful web services.'
arch=(any)
url='https://github.com/azure/autorest'
license=('MIT')
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($npmname-$pkgver.tgz)
sha512sums=('b533a77d0abe2c0caa9f116b38e9f2084684ad79e345381db9437b6bc2d4bf6bb975ea83948d33a099651de204603652da8d8aaf5b3ca438f63716853ce5a576')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/node_modules/
  cd $pkgdir/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
