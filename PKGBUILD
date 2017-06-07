# Maintainer: Terunori Togo <terut.dev+github at gmail dot com>
_npmname=heroku-cli
pkgname=nodejs-$_npmname
pkgver=6.9.5
pkgrel=1
pkgdesc="The next generation Node-based Heroku CLI"
arch=("any")
url="https://github.com/heroku/cli"
license=('ISC')
depends=('nodejs>=7.10.0' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('396776e609f89cd699304e35cc87d85d3fef80793ada4bed1b4bb4710e390add1c463fc696bac34c67cb2ee88da92463ecb52e979e9d65862904a96103f4f9bf')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  install -Dm644 "$_npmdir/$_npmname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -r "$pkgdir"/usr/etc
  chmod -R go-w "$pkgdir"/usr
}
