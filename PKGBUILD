_npmname=node-lambda
pkgname=nodejs-$_npmname
pkgver=0.22.0 # renovate: datasource=github-tags depName=motdotla/node-lambda
pkgrel=1
pkgdesc="Command line tool to locally run and deploy your node.js application to Amazon Lambda"
arch=(any)
url="https://github.com/motdotla/node-lambda"
license=('BSD')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('b991a4599b18bd9dea1294c868f3db1791939436096f9b20b9d4d29c6e7c9907')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
