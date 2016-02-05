# Maintainer: Gregory Scheerlinck <gregory dot scheerlinck at gmail dot com>
_npmname=arch-wiki-man
_npmver=1.0.5
pkgname=arch-wiki-man # All lowercase
pkgver=1.0.5
pkgrel=1
pkgdesc="The Arch Wiki as linux man pages"
arch=('any')
url="https://github.com/greg-js/arch-wiki-man#readme"
license=('GPL3')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(58210d19e1949e0a209c2c60b2bce3dbb0360a59)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
