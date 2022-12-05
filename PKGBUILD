# Maintainer: enigma <hf.enigma at gmail>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=osmtogeojson
pkgver=3.0.0b5
_pkgver=3.0.0-beta.5
pkgrel=1
pkgdesc="Convert OSM data to GeoJSON"
arch=(any)
url="https://github.com/tyrasd/osmtogeojson"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz)
b2sums=('ec18ebe4b052e95d7807a0bc48a4466ac6bc2dc3a5387a94ac1caf0cb49a6efd4cbc46231bba602a5228bf6b1d5e383aa834a2e520f57f791f83b8d8093655a5')
noextract=("${pkgname}-${_pkgver}.tgz")

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$_pkgver.tgz"
  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
