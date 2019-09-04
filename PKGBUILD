pkgname=libosp-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="HemiStereo sensor libraries"
arch=('x86_64')
url="https://3dvisionlabs.com/"
license=('unknown')
depends=('boost' 'grpc' 'opencv' 'protobuf')

source=("https://3dvisionlabs.com/wp-content/downloads/HemiStereo-$pkgver-Linux.tar.gz")
sha256sums=('666ff1dafbda25e5ad45452d817ae5c82c5624ea26fae02cc2598f0baa2fca8b')

package() {
    install -d "${pkgdir}/usr/lib/osp"

    rm -r "${srcdir}/HemiStereo-${pkgver}-Linux/lib/osp/cmake/CMakeModules/"
    rm "${srcdir}/HemiStereo-${pkgver}-Linux/lib/osp/cmake/qt.conf.in"

    cp -r "${srcdir}/HemiStereo-${pkgver}-Linux/include/" "${pkgdir}/usr"
    cp -r "${srcdir}/HemiStereo-${pkgver}-Linux/lib/osp/cmake/" "${pkgdir}/usr/lib/osp"

    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_calib.so" "${pkgdir}/usr/lib/"
    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_core.so" "${pkgdir}/usr/lib/"
    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_sdk.so" "${pkgdir}/usr/lib/"
    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_types.so" "${pkgdir}/usr/lib/"

    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_cv.so" "${pkgdir}/usr/lib/"
    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_io.so" "${pkgdir}/usr/lib/"
    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_updater.so" "${pkgdir}/usr/lib/"

    cp -r "${srcdir}/HemiStereo-${pkgver}-Linux/lib/osp/qml/" "${pkgdir}/usr/lib/osp"
}
