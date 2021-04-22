pkgname=libosp-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="HemiStereo sensor libraries"
arch=('x86_64')
url="https://3dvisionlabs.com/"
license=('unknown')
depends=('boost' 'grpc' 'protobuf')
optdepends=('opencv')

source=("https://files.3dvisionlabs.com/hemistereo/lnx-x86_64/HemiStereo-$pkgver-Linux.tar.gz")
sha256sums=('9ce57c0f0f0cf864a157f50f3761e5af3adc5ee6e2acc76eb0c9ebace8c021dd')

package() {
    install -d "${pkgdir}/usr/lib/osp"

    cp -r "include/" "${pkgdir}/usr"
    cp -r "lib/cmake/" "${pkgdir}/usr/lib"

    install -m755 "lib/libosp_calib.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_core.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_cv.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_grpc_server.a" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_grpc_service.a" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_io.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_sdk.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_stereo.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_types.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_version.so" "${pkgdir}/usr/lib/"

    cp -r "lib/osp/qml/" "${pkgdir}/usr/lib/osp"
}
