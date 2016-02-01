# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=mapbox-studio
pkgver=0.3.3
pkgrel=1
pkgdesc="Vector tile driven map design"
arch=('x86_64')
url="https://mapbox.com/mapbox-studio/"
license=(BSD)
depends=()
makedepends=(unzip)
source=("https://mapbox.s3.amazonaws.com/mapbox-studio/mapbox-studio-linux-x64-v${pkgver}.zip")
noextract=("mapbox-studio-linux-x64-v${pkgver}.zip")
sha1sums=('b0c80aa7143e47db0f08144f302cd96654d2cc65')

prepare() {
  unzip -q mapbox-studio-linux-x64-v${pkgver}.zip
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "mapbox-studio-linux-x64-v${pkgver}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/atom" "${pkgdir}/opt/${pkgname}/mapbox-studio"
}

# vim:set ts=2 sw=2 et:
