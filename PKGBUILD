# Maintainer: Craig Cabrey <craigcabrey@gmail.com>
pkgname=grestful
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple RESTful API client written in GTK 3."
arch=("i686" "x86_64")
url="https://github.com/gert-dev/grestful"
license=("MPL")
depends=("gtk3" "gtksourceview3" "curl")
makedepends=("dub" "dmd")
source=("https://github.com/Gert-dev/grestful/archive/${pkgver}.tar.gz")
md5sums=("0005f6628f0a0e195a5ed83b1a27d60c")

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
