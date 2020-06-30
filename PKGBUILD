_npmname=@kruhlmann/nodelock
_npmver=1.1.5
pkgname=nodelock-git
pkgver=1.1.5
pkgrel=1
pkgdesc="Locking utility for smart cards"
arch=(any)
url="https://github.com/kruhlmann/nodelock"
license=()
depends=('nodejs' 'npm' 'xscreensaver')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/nodelock-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(7814094cc215799542ae31229929df8747dc742d)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  mkdir -p "$pkgdir/usr/bin"
  cd $_npmdir
  npm install -g --user root --unsafe-perm --prefix "$pkgdir/usr" $_npmname
  chmod 755 "$pkgdir/usr/lib/node_modules/$_npmname/nodelock"
  ln -sf "$pkgdir/usr/lib/node_modules/$_npmname/nodelock" "$pkgdir/usr/bin/nodelock"
}

# vim:set ts=2 sw=2 et:
