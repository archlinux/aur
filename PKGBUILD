# Maintainer: Craig Cabrey <craigcabrey@gmail.com>
pkgname=grestful
pkgver=1.1.1
pkgrel=2
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
  builddir="${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp "${builddir}/grestful" "${pkgdir}/usr/bin/grestful"
  mkdir -p "${pkgdir}/usr/share/grestful"
  cp -R "${builddir}/public/design" "${pkgdir}/usr/share/grestful/"
  mkdir -p "${pkgdir}/usr/share/applications"
  cp -R "${builddir}/public/grestful.desktop" "${pkgdir}/usr/share/applications/"
}
