# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=generator-gulp-angular
pkgname=nodejs-$_npmname
pkgver=0.12.1
pkgrel=1
pkgdesc="Yeoman generator for Gulp & Angular"
arch=('any')
url="https://github.com/Swiip/generator-gulp-angular"
license=('MIT')
depends=('nodejs-yeoman' 'nodejs-gulp' 'nodejs-bower')
optdepends=('ruby-sass: needed to build ruby sass preprocessed projects'
            'java-runtime: needed to do e2e protractor tests')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('873dc8d48f39456c03baf4b787fc9f1ca43eb715')
install=${pkgname}.install

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/yo
}

# vim:set ts=2 sw=2 et:

