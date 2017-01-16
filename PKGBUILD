# Maintainer: Lukas Grossar <lukas.grossar@gmail.com

_npmname=dockerlint
pkgname=nodejs-dockerlint # All lowercase
pkgver=0.2.0
pkgrel=1
pkgdesc="A linter for Dockerfiles"
arch=(any)
url="https://github.com/RedCoolBeans/dockerlint"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=(8afa551af7024aba97965b5f5c305f00d7b805f5b47aa62612f5162eba20b28f07cf23d1d2efd234cb7281c28ef8448346bd52df2b4a0db84c1c055a67110e4c)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
