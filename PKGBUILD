# Maintainer: Enihcam <gmail n a n e r i c w a n g>

pkgname=compute-runtime-bin
pkgver=18.21.10858
pkgrel=1
pkgdesc='Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond (binary version)'
arch=(x86_64)
url='https://github.com/intel/compute-runtime'
license=(MIT)
install=${pkgname}.install
depends=(zlib ncurses5-compat-libs)
optdepends=(libdrm libva ocl-icd)
provides=(opencl-driver)
conflicts=(beignet compute-runtime)
source=(${url}/releases/download/${pkgver}/intel-opencl_${pkgver}_amd64.deb)
sha256sums=('9c46c04a36551d101544666d2e1add9b1deea07911ba67fd6261cd11f96ca4bb')

package() {
    tar -xJC "${pkgdir}" -f data.tar.xz
    chmod 755 ${pkgdir}/opt/intel/opencl/*.so
    chown root:root ${pkgdir}/opt/intel/opencl/*.so
}
