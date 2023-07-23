pkgname="theli"
pkgver=3.1.4
pkgrel=6
pkgdesc="THELI is a data processing pipeline for optical, near-infrared and mid-infrared astronomical images"
arch=("x86_64")
url='https://github.com/schirmermischa/THELI'
license=('GPL3')
depends=('astromatic-scamp' 'astromatic-swarp')
makedepends=('wcslib' 'gsl' 'libraw')
optdepends=('astrometry.net')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/schirmermischa/THELI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99815dc9738c2a3acdad54d9cfaf23b758cb542a3e15c9a5779948c440118a3d')


build() {
    cd "THELI-${pkgver}/src"
    qmake -o Makefile THELI.pro
    make
}

package() {
    cd "${srcdir}/THELI-${pkgver}/src"
    make INSTALL_ROOT="$pkgdir" install
}
