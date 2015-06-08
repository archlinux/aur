# Maintainer: Jonne Haß <me@jhass.eu>

_npmname=ember-cli
pkgname=nodejs-$_npmname
pkgver=0.2.7
pkgrel=1
pkgdesc="The ember command line interface"
arch=('any')
url="http://emberjs.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('6dcc54c7ba272c6edbf90b190d536347f464f4b8f5ab7f606937b9cae16c127f')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
