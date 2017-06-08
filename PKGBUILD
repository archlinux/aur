# Maintainer: Terunori Togo <terut.dev+github at gmail dot com>
_npmname=heroku-cli
pkgname=nodejs-$_npmname
pkgver=6.9.7
pkgrel=1
pkgdesc="The next generation Node-based Heroku CLI"
arch=("any")
url="https://github.com/heroku/cli"
license=('ISC')
depends=('nodejs>=7.10.0' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('46c774c53bdb146f7c5def535060271c83c7a77eaa050b0cc1064ea32f2ff91417a812fceee698fdb3988a1bb25445ab1160fe5c41dc745ae16cd0e51e2a5919')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  install -Dm644 "$_npmdir/$_npmname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -r "$pkgdir"/usr/etc
  chmod -R go-w "$pkgdir"/usr
}
