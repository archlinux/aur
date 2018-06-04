# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=osmtogeojson
pkgver=3.0.0b3
_npmver=3.0.0-beta.3
pkgrel=2
pkgdesc="Convert OSM data to GeoJSON"
arch=(any)
url="https://github.com/tyrasd/osmtogeojson#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$_npmver.tgz)
noextract=($pkgname-$_npmver.tgz)
replaces=('nodejs-osmtogeojson')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$_npmver
  install -Dm755 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha1sums=('499f91feaa612ec845df420f107e2e6bc28f0563')
