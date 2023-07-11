# Arch User repository PKGBUILD file
# Builds the pyshtools library (split file)
# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgbase=rlftlbx
pkgname=(rlftlbx)
pkgver=1.0.0
pkgrel=0
pkgdesc="RLFTLBX: Command line tools for joint inversion stuff and geodesy"
arch=('any')
url="https://github.com/strawpants/rlftlbx"
license=('LGPL V3.0')
depends=("fftw" "blas" "lapack" "shtools" "netcdf-fortran")
makedepends=("gcc-fortran")
source=("https://github.com/strawpants/rlftlbx/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('82eb0bd6e7db7baf40548b62baaa9f82479223252391efbf6c69db61167bb085')


package(){
   
   mkdir ${srcdir}/rlftlbx-${pkgver}/build
   cd ${srcdir}/rlftlbx-${pkgver}/build
   cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" ../
   make
   make install
   install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
   cd ${_startdir}
}



