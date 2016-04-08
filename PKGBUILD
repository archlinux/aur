# Maintainer: Gregory Scheerlinck <gregory dot scheerlinck at gmail dot com>
_npmname=arch-wiki-man
_npmver=1.2.2
pkgname=arch-wiki-man # All lowercase
pkgver=1.2.2
pkgrel=1
pkgdesc="The Arch Wiki as linux man pages"
arch=(any)
url="https://github.com/greg-js/arch-wiki-man#readme"
license=( GPL3 )
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(137ecc07b3d14f4e6e15e8f12e52c91f0c44e2dd)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
