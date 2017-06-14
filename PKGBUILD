# Maintainer: Terunori Togo <terut.dev+github at gmail dot com>
_npmname=heroku-cli
pkgname=nodejs-$_npmname
pkgver=6.11.7
pkgrel=1
pkgdesc="The next generation Node-based Heroku CLI"
arch=("any")
url="https://github.com/heroku/cli"
license=('ISC')
depends=('nodejs>=7.10.0' 'npm')
conflicts=('heroku' 'heroku-toolbelt')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('68f49c39c577d2e19132b8acebb3f32380132924e4a90b103c05a022f309fa40a1b88a201dbfcf6709492efcab6d59dff04352f7e862c184ad2987051d32464a')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  install -Dm644 "$_npmdir/$_npmname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -r "$pkgdir"/usr/etc
  chmod -R go-w "$pkgdir"/usr
}
