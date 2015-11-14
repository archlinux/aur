# Maintainer: Craig Cabrey <craigcabrey@gmail.com>
pkgname=grestful
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple RESTful API client written in GTK 3."
arch=("i686" "x86_64")
url="https://github.com/gert-dev/grestful"
license=("MPL")
depends=("gtk3" "gtksourceview3" "curl")
makedepends=("dub" "dmd")
source=("https://github.com/Gert-dev/grestful/archive/${pkgver}.tar.gz")
md5sums=("903d3825f5f45df13068a25adada2202")

build() {
  cd "${pkgname}-${pkgver}"
  dub build --build=release
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/${pkgname}-${pkgver}/grestful" "${pkgdir}/usr/bin/grestful"
  mkdir -p "${pkgdir}/usr/share"
  cp -R "${srcdir}/${pkgname}-${pkgver}/public" "${pkgdir}/usr/share/grestful"
}
