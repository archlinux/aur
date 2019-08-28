# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=libvisio2svg
pkgver=0.5.5
pkgrel=3
pkgdesc="VSS/VSD (Visio Stencil/Drawing) to SVG conversion library"
arch=('x86_64')
url="https://github.com/kakwa/libvisio2svg"
license=('GPL')
depends=('librevenge' 'libvisio' 'libemf2svg' 'libxml2' 'libwmf')
makedepends=('cmake')
provides=('libvisio2svg')
conflicts=('libvisio2svg-git')
sha512sums=('42b0a66f839885aa46022a6fb9dda40143586a14a0a880eb8af71a749de312f8b6ed00f1c4e2f9e438814dcabb638672a2f2b2d5c85be015ce6ee4dc59ae8765')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kakwa/libvisio2svg/archive/${pkgver}.tar.gz")

build() {
    cd "${pkgname}-${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
