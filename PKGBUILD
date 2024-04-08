# Maintainer: FederAndInk <unifai at protonmail dot com>
_npmsubname=linthtml
_npmname=@linthtml/${_npmsubname}
_npmver=0.9.6
pkgname=linthtml # All lowercase
pkgver=${_npmver}
pkgrel=1
pkgdesc="The html5 linter and validator."
arch=(any)
url="https://github.com/linthtml/linthtml/tree/main/packages/linthtml#readme"
license=(ISC)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmsubname-$_npmver.tgz)
noextract=($_npmsubname-$_npmver.tgz)
sha512sums=(6da94cc03a65d062aad31df96854ac12e3ca5329f6aa8cfbf774a9ad166f16edf491f75795d1f94c15ecb9dd65b5ffcdd9120441cb4adf191db4129b6ff64b60)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -Dm644 "$pkgdir/usr/lib/node_modules/${_npmname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
