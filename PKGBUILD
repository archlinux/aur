pkgname=libosp-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="HemiStereo sensor libraries"
arch=('x86_64')
url="https://3dvisionlabs.com/"
license=('unknown')
depends=('boost' 'grpc' 'opencv' 'protobuf')

source=('https://3dvisionlabs.com/wp-content/downloads/HemiStereo-0.9.1-Linux.tar.gz')
sha256sums=('00eaf5b502e54268456417bb76dbc5276c208785a00e6315cd905cb211c54bde')

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
    install -m644 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_grpc_service.a" "${pkgdir}/usr/lib/"
    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_io.so" "${pkgdir}/usr/lib/"
    install -m755 "${srcdir}/HemiStereo-${pkgver}-Linux/lib/libosp_updater.so" "${pkgdir}/usr/lib/"

    cp -r "${srcdir}/HemiStereo-${pkgver}-Linux/lib/osp/qml/" "${pkgdir}/usr/lib/osp"
}
