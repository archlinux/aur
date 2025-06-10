# Maintainer:
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_npmname=cross-env
pkgname=nodejs-$_npmname
pkgver=7.0.3
pkgrel=2
pkgdesc="Node cross platform setting of environment scripts"
url="https://github.com/kentcdodds/cross-env"
license=('MIT')
arch=('i686' 'x86_64')

depends=('nodejs')
makedepends=('npm')

source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d44ad3b6925ff024f64fc4eec88a7da8b8291dd66de858c34866be611ad3c5de')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
