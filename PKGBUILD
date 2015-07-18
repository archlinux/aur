# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=generator-mobileangularui
_npmver=1.2.1
pkgname=nodejs-$_npmname
pkgver=1.2.1
pkgrel=1
pkgdesc="Yeoman generator for Mobile Angular UI"
arch=('any')
url="https://github.com/mcasimir/mobile-angular-ui"
license=('BSD')
depends=('nodejs-yeoman' 'nodejs-gulp' 'nodejs-bower' 'nodejs-mocha')

source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('437a146b24bf3a73e2173f08ce076daa25d5cf92f37066be993520b9bba02bdf')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver --python=python2
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}

# vim:set ts=2 sw=2 et:

