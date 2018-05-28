# Maintainer: Enihcam <gmail n a n e r i c w a n g>

pkgname=compute-runtime-bin
pkgver=18.20.10830
pkgrel=2
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
sha256sums=('c6f21318d566ceaaa124f96a753478b4cbac3261c7caa1a7b4a1bb95b8778505')

package() {
    tar -xJC "${pkgdir}" -f data.tar.xz
    chmod 755 ${pkgdir}/opt/intel/opencl/*.so
}
