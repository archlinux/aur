# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=clean-css-cli
pkgname=nodejs-$_npmname
pkgver=4.2.1
pkgrel=1
pkgdesc="The command line interface to clean-css CSS optimizer."
arch=('any')
url="https://github.com/jakubpawlowicz/clean-css-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('96066c72dd16ccc32a5a453063f74ae78c27ab49ad9e2bb21f134d8720a4b455')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
