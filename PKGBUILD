# Maintainer: FederAndInk <unifai at protonmail dot com>
_npmsubname=linthtml
_npmname=@linthtml/${_npmsubname}
_npmver=0.9.5
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
sha512sums=(f0c728b96da00adddb8371a72b593df0a2f92e20d5b58fb01320e381f0ba31da9b1ab99521dd01e80282d5e476c10e5f46f69d171371e567bf416dcaed58a6db)

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
