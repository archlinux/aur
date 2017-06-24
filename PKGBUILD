# Maintainer: Terunori Togo <terut.dev+github at gmail dot com>
_npmname=heroku-cli
pkgname=nodejs-$_npmname
pkgver=6.11.17
pkgrel=1
pkgdesc="The next generation Node-based Heroku CLI"
arch=("any")
url="https://github.com/heroku/cli"
license=('ISC')
depends=('nodejs>=7.10.0' 'npm')
conflicts=('heroku' 'heroku-toolbelt')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('4bed82db0c18ffcdc55d9135f72264acfce25e1e64f30458a271ccfb0fe3370e2af7aa39872d121cb9fc74e75de5f802708717a9061237e965d8b74d9ac4053c')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  install -Dm644 "$_npmdir/$_npmname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -r "$pkgdir"/usr/etc
  chmod -R go-w "$pkgdir"/usr
}
