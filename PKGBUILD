# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_npmname=cross-env
pkgname=nodejs-$_npmname
pkgver=10.1.0
pkgrel=1
pkgdesc="Node cross platform setting of environment scripts"
url="https://github.com/kentcdodds/cross-env"
license=('MIT')
arch=('i686' 'x86_64')

depends=('nodejs')
makedepends=('npm')

source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('1ac628b209c00994c00dc984c8972d909228a808478edb70ed1b05ad5a093576ec596a9aaba626fbb9198eaea64b8e4ed238a3eafb6245ea6929012da96cba0f')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
