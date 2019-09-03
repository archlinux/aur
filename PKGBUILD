pkgname=libosp-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="HemiStereo sensor libraries"
arch=('x86_64')
url="https://3dvisionlabs.com/"
license=('unknown')
depends=('boost' 'grpc' 'opencv' 'protobuf')

source=("https://3dvisionlabs.com/wp-content/downloads/HemiStereo-$pkgver-Linux.tar.gz")
sha256sums=('e73a81679b02d5489860c53944ae01af3cdb0a2b43a5ffea65082d0b6579c5c4')

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
