# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=clean-css-cli
pkgname=nodejs-$_npmname
pkgver=4.1.10
pkgrel=1
pkgdesc="The command line interface to clean-css CSS optimizer."
arch=('any')
url="https://github.com/jakubpawlowicz/clean-css-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('da77d48af29b5433c2500e289bae37e380394c586905ef9e7c8e97a1227f786e')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  rm -r "$pkgdir"/usr/etc
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
