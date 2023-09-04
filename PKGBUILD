_npmname=have-it
pkgname=nodejs-$_npmname
pkgver=1.12.0 # renovate: datasource=github-tags depName=bahmutov/have-it
pkgrel=1
pkgdesc="The fastest NPM install does nothing because you already have it"
arch=(any)
url="https://github.com/bahmutov/have-it"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('9f7898487e79b1904eb8ef912a6cb16566b87df42c4e6cbc13abb41bb52f46ea')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
