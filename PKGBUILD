_npmname=node-lambda
pkgname=nodejs-$_npmname
pkgver=0.11.0
pkgrel=1
pkgdesc="Command line tool to locally run and deploy your node.js application to Amazon Lambda"
arch=(any)
url="https://github.com/motdotla/node-lambda"
license=('BSD')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
md5sums=('59452acc357fcc13ec5af2c0f23a8072')
