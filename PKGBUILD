# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=libvisio2svg
pkgver=0.5.5
pkgrel=1
pkgdesc="Library/Utilities to convert Microsoft (MS) Visio Documents and Stencils (VSS and VSD) to SVG"
arch=('x86_64')
url="https://github.com/kakwa/libvisio2svg"
license=('GPL')
depends=('librevenge' 'libvisio' 'libemf2svg' 'libxml2' 'libwmf')
provides=('libvisio2svg')
conflicts=('libvisio2svg-git')
sha512sums=('42b0a66f839885aa46022a6fb9dda40143586a14a0a880eb8af71a749de312f8b6ed00f1c4e2f9e438814dcabb638672a2f2b2d5c85be015ce6ee4dc59ae8765')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kakwa/libvisio2svg/archive/${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
