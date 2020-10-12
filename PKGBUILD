# Maintainer: philipp.classen@posteo.de
_npmname=generator-web-extension
_npmver=0.0.5
pkgname=nodejs-generator-web-extension
pkgver=0.0.5
pkgrel=1
pkgdesc="Yeoman generator for Webextensions"
arch=(any)
url="https://github.com/webextension-toolbox/generator-web-extension"
license=('MIT')
depends=(
  'nodejs-yeoman'
)
makedep=(
  'npm'
)
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('17441d5c0e665c0ff8c8e7a85ef54c311d1bbe73ee103ce82068bb468d7279e8')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
  chown -R root:root "$pkgdir"/usr
}

# vim:set ts=2 sw=2 et:
