pkgname=libosp-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="HemiStereo sensor libraries"
arch=('x86_64')
url="https://3dvisionlabs.com/"
license=('unknown')
depends=('boost' 'grpc' 'protobuf')
optdepends=('opencv')

source=("https://files.3dvisionlabs.com/hemistereo/lnx-x86_64/HemiStereo-v$pkgver-Linux.tar.gz")
sha256sums=('531f2584e45fc9e1f1c5b7828104bb326a598de38da38687e96ccbf9e7fa473e')

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
    install -m755 "lib/libosp_types.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_version.so" "${pkgdir}/usr/lib/"

    cp -r "lib/osp/qml/" "${pkgdir}/usr/lib/osp"
}
