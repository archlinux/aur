# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Vlad M. <vlad@archlinux.net>

_npmname=tiddlywiki
pkgname=nodejs-$_npmname
pkgver=5.1.8
pkgrel=1
pkgdesc="A non-linear personal web notebook"
url="http://tiddlywiki.com/"
arch=('any')
license=('BSD')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('15b543cff03c7ddf191355d9fc4a6abc0d0fe79995debec3da550fc7974bc03e')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
