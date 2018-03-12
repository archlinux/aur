_npmname=@simon04/npm2arch
_npmver=1.0.0
pkgname=nodejs-npm2arch # All lowercase
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert NPM package to a PKGBUILD for ArchLinux"
arch=(any)
url="https://github.com/simon04/npm2arch"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e53348f74f661b3430f94011a3d597fb0db80741)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  sed -i '/"_where":/d' "$_npmname/package.json"
}

# vim:set ts=2 sw=2 et:
