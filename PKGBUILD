# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=healpix
_pkgname=${pkgname}
pkgver='3.31_2016Aug26'
_dir='Healpix_3.31'
pkgrel=3
pkgdesc="Software for pixelization, hierarchical indexation, synthesis, analysis, and visualization of data on the sphere."
arch=(any)
url="https://sourceforge.net/projects/healpix/"
license=('unknown')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/files/${_dir}/Healpix_${pkgver}.tar.gz")
sha256sums=('ddf437442b6d5ae7d75c9afaafc4ec43921f903c976e25db3c5ed5185a181542')
build() {
    cd "${srcdir}/${_dir}"
    cp ../../Makefile ${srcdir}/${_dir}
    mkdir -p lib include
    make -j
}
check() {
    cd "${srcdir}/${_dir}"
}
package() {
    cd "${srcdir}/${_dir}"
    install -Dm755 lib/libchealpix.so "$pkgdir/usr/lib/libchealpix.so"
    install -Dm755 include/chealpix.h "$pkgdir/usr/include/chealpix.h"
}
