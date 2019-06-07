_npmname=interactive-diff-patch
_npmver=0.0.16
pkgname=interactive-diff-patch # All lowercase
pkgver=0.0.16
pkgrel=1

pkgdesc="A terminal program that allows you to compare two folders or files and merge differences one section at a time per each file and preview them interactivly."
arch=(any)
url="https://gitlab.com/bixfliz/interactive-diff-patch"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(965e71b86c48ab4a0b3392e69a29b985bf23b93f)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
