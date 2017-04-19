_npmname=npm2arch
_npmver=0.1.19
pkgname=nodejs-npm2arch # All lowercase
pkgver=0.1.19
pkgrel=2
pkgdesc="Convert NPM package to a PKGBUILD for ArchLinux"
arch=(any)
url="https://github.com/Filirom1/npm2arch"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(git+http://github.com/MazeChaZer/npm2arch.git#branch=feature/upgrade-dependencies)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(SKIP)

package() {
  cd "$srcdir/$_npmname"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  npm install -g --prefix "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
