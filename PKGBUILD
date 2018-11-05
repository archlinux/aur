_npmname=interactive-diff-patch
_npmver=0.0.5
pkgname=interactive-diff-patch # All lowercase
pkgver=0.0.5
pkgrel=1
pkgdesc="Allows you to apply diff hunks one at a time and preview them on the command line. On Windows this requires diff and patch which are included with git."
arch=(any)
url="https://gitlab.com/bixfliz/interactive-diff-patch"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(195e961e295e7223226218449b0b7d3da5dcee90)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
