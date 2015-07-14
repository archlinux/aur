# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

_npmname=jsfmt
pkgname=nodejs-$_npmname
pkgver=0.4.1
pkgrel=1
pkgdesc="gofmt for javascript"
arch=(any)
url=http://rdio.github.io/jsfmt/
license=(Apache)
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('3643eeb4c6318d9b2ca74b609ff2727955826d4379aef8af38725b3fe8b802b0')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
