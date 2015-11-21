# Maintainer: Jonne Haß <me@jhass.eu>

_npmname=ember-cli
pkgname=nodejs-$_npmname
pkgver=1.13.13
pkgrel=1
pkgdesc="The ember command line interface"
arch=('any')
url="http://www.ember-cli.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('5336869c8ae9b891ae5b74cea3f48dea111dff3e0bb9c576ce1ac8a9bbe85ecb')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --no-optional --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
