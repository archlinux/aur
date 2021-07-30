# Maintainer: Andreas Hauser <andreas.github@icloud.com>

pkgbase=ffindex
pkgdesc="simple index/database for huge amounts of small files"
pkgver=1.0
pkgrel=1
url=https://github.com/ahcm/ffindex
arch=(x86_64 i686)
license=('CCPL:cc-by-sa-3.0')
source=("https://github.com/ahcm/ffindex/archive/refs/tags/ffindex-${pkgver}.tar.gz")
sha256sums=('6d30ba22be43fe852680eac6334dc8133c8fad3d5bdde45299f9f82095b4b0ce')
pkgname=ffindex
depends=(openmpi)


build() {
        cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
        make HAVE_MPI=1
}

package() {
        cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
        make INSTALL_DIR=${pkgdir}/usr install HAVE_MPI=1
        mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
}
