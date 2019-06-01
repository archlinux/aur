_npmname=lint-md
_npmver=0.1.1
pkgname=nodejs-lint-md # All lowercase
pkgver=0.1.1
pkgrel=1
pkgdesc="Cli tool to lint your markdown file for Chinese."
arch=(any)
url="https://github.com/hustcc/lint-md#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(cb6b87c19b1552910cb43be79e9ed37d253acaeb)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  find ./ -type f -exec sed -i "s@$pkgdir/usr@/usr@g" {} \;
  chmod 755 "$pkgdir/usr/bin/lint-md"
}

# vim:set ts=2 sw=2 et:
