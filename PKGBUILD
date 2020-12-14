# Maintainer marcs <aur@mg.odd.red>

_npmname=glslify
_npmver=7.1.1
pkgname=nodejs-glslify # All lowercase
pkgver=7.1.1
pkgrel=1
pkgdesc="A node.js-style module system for GLSL!"
arch=(any)
url="https://github.com/stackgl/glslify"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
sha256sums=('70eac17441d005e885642490190e5a6c81e666632d1f0e5a6ed2197415809cd5')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
