_npmname=now
pkgname=nodejs-$_npmname
pkgver=7.1.1
pkgrel=1
pkgdesc="The command line interface for Zeit Now"
arch=(any)
url="https://github.com/zeit/now-cli"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f478d523778d9eb1945e4c917a3f14dc60e42516d5ca8484ccbb74245ac72b35')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
