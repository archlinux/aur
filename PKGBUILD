pkgname=autorest
pkgver=3.2.3
pkgrel=1
pkgdesc='The AutoRest tool generates client libraries for accessing RESTful web services.'
arch=(any)
url='https://github.com/azure/autorest'
license=('MIT')
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($npmname-$pkgver.tgz)
sha512sums=('8909174739b9d81f4e5a057c4cbda2a0782a16fc0e875f94c4fea7b6f22d83e64108f15701e156345e53a39d3002e9ed4cf98fa12a3ed22dcdb970bb4a08e4af')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/node_modules/
  cd $pkgdir/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
