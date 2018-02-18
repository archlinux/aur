pkgname=parcel-bundler
pkgver=1.6.1
pkgrel=1
pkgdesc="Blazing fast, zero configuration web application bundler"
arch=(any)
url="https://parceljs.org/"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

# vim:set ts=2 sw=2 et:
sha256sums=('858422e0f8a3ae12d79f595a4325103576f2d92dd7cd051893a6e71ce27da33d')
