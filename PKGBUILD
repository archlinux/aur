pkgname="theli"
pkgver=3.1.4
pkgrel=1
pkgdesc="THELI is a data processing pipeline for optical, near-infrared and mid-infrared astronomical images"
arch=("x86_64")
url='https://github.com/schirmermischa/THELI'
license=('GPL3')
makedepends=('wcslib' 'gsl')
source=("https://github.com/schirmermischa/THELI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99815dc9738c2a3acdad54d9cfaf23b758cb542a3e15c9a5779948c440118a3d')


build() {
    cd "THELI-${pkgver}"
    qmake -o Makefile src/THELI.pro
    make
}

package() {
    cd "THELI-${pkgver}"
    make INSTALL_ROOT="$pkgdir" install
}
