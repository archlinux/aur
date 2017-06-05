# Maintainer: Terunori Togo <terut.dev+github at gmail dot com>
_npmname=heroku-cli
pkgname=nodejs-$_npmname
pkgver=6.7.4
pkgrel=1
pkgdesc="The next generation Node-based Heroku CLI"
arch=("any")
url="https://github.com/heroku/cli"
license=('ISC')
depends=('nodejs>=7.10.0' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('8fb89ad3576bf3a4eae15d11a1d18818825e75082be8339fff3c0ec14ffd911131b26f490d7d752c46a2c2959e383c5497b956e8c08a1937c938ffdbd81dcb93')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  install -Dm644 "$_npmdir/$_npmname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
