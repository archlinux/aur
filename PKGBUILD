# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=libemf2svg
pkgver=1.1.0
pkgrel=3
pkgdesc="EMF (Microsoft Enhanced Metafile) to SVG conversion library"
arch=('x86_64')
url="https://github.com/kakwa/libemf2svg"
license=('GPL')
depends=('libpng' 'libiconv' 'fontconfig' 'freetype2')
makedepends=('cmake')
provides=("libemf2svg")
conflicts=("libemf2svg-git")
sha512sums=('1e9c1274cb7fc3552e7d91169b500ee9d3e1870e411059abc0b343b8b82382e42127b59023753336580f591437003ad0565b6653d661ce5008baa64ebb6f1bd8')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kakwa/libemf2svg/archive/${pkgver}.tar.gz")

build() {
    cd "${pkgname}-${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
