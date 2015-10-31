# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=generator-angular
_npmver=0.14.0
pkgname=nodejs-generator-angular
pkgver=0.14.0
pkgrel=1
pkgdesc="Yeoman generator for AngularJS"
arch=(any)
url="https://github.com/yeoman/generator-angular"
license=(BSD)
depends=('nodejs-yeoman' 'nodejs-generator-karma')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(a5d91dacff08894623f80e16dd0e5df99fe56734)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo,generator-karma}
}

# vim:set ts=2 sw=2 et:
