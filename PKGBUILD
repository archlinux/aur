# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=mapbox-studio
pkgver=0.3.4
pkgrel=1
pkgdesc="Vector tile driven map design"
arch=('x86_64')
url="https://mapbox.com/mapbox-studio-classic/"
license=(BSD)
depends=()
makedepends=(unzip)
source=("https://mapbox.s3.amazonaws.com/mapbox-studio/mapbox-studio-linux-x64-v${pkgver}.zip")
noextract=("mapbox-studio-linux-x64-v${pkgver}.zip")
sha1sums=('521e722fd5a317f48af2dc718447c9323041bd85')

prepare() {
  unzip -q mapbox-studio-linux-x64-v${pkgver}.zip
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "mapbox-studio-linux-x64-v${pkgver}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/atom" "${pkgdir}/opt/${pkgname}/mapbox-studio"
}

# vim:set ts=2 sw=2 et:
