# Maintainer: Marcin Kornat <rarvolt@gmail.com>

_npmname=generator-react-webpack
_npmver=3.3.4
pkgname=nodejs-generator-react-webpack
pkgver=3.3.4
pkgrel=1
pkgdesc="Yeoman generator for ReactJS with Webpack"
arch=(any)
url="https://github.com/react-webpack-generators/generator-react-webpack"
license=(BSD)
depends=('nodejs-yeoman')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('0cb18410ea1b4c5031931211c8584848403bac3c')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}

# vim:set ts=2 sw=2 et:
