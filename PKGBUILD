_npmname=glslify
_npmver=6.0.2
pkgname=nodejs-glslify # All lowercase
pkgver=6.0.2
pkgrel=1
pkgdesc="A node.js-style module system for GLSL!"
arch=(any)
url="https://github.com/stackgl/glslify"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
sha256sums=('67315cf13ec0349df4746a9e1d267cbcf308e8e8022c3823872f1533259c45c3')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
