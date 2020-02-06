pkgname=libosp-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="HemiStereo sensor libraries"
arch=('x86_64')
url="https://3dvisionlabs.com/"
license=('unknown')
depends=('boost' 'grpc' 'protobuf')
optdepends=('opencv')

source=("https://files.3dvisionlabs.com/hemistereo/lnx-x86_64/HemiStereo-v$pkgver-Linux.tar.gz")
sha256sums=('49c23a803a04af795182c3d827a7b0af93fc4603f3863ebebf94ac3c979d9dd5')

package() {
    install -d "${pkgdir}/usr/lib/osp"

    cp -r "include/" "${pkgdir}/usr"
    cp -r "lib/cmake/" "${pkgdir}/usr/lib"

    install -m755 "lib/libosp_calib.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_core.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_cv.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_io.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_sdk.so" "${pkgdir}/usr/lib/"
    install -m755 "lib/libosp_types.so" "${pkgdir}/usr/lib/"

    cp -r "lib/osp/qml/" "${pkgdir}/usr/lib/osp"
}
