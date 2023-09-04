_npmname=json-to-js
pkgname=nodejs-$_npmname
pkgver=1.0.2 # renovate: datasource=github-tags depName=Dinoshauer/json-to-js
pkgrel=1
pkgdesc="Convert JSON to JS and output to stdout"
arch=(any)
url="https://github.com/Dinoshauer/json-to-js"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('a4e2eed8443bd9fd68b3b7d0921db118b9b3bd72e03d3c85143fe7734ddf1e18')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
