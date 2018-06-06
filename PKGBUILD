# Maintainer: Enihcam <gmail n a n e r i c w a n g>

pkgname=compute-runtime-bin
pkgver=18.22.10890
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
sha256sums=('80b1e5a6b074c1eb2b7d6e0b4a961b52e7d3f1719cac9dd0f45fdb735c188676')

package() {
    tar -xJC "${pkgdir}" -f data.tar.xz
    chmod 755 ${pkgdir}/opt/intel/opencl/*.so
    chown root:root ${pkgdir}/opt/intel/opencl/*.so
}
