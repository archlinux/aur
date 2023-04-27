# Maintainer: sant0s <diego.delossantos@mailbox.org>

pkgname=onnxruntime-bin
pkgver=1.14.1
pkgrel=3
pkgdesc="ONNX Runtime: cross-platform, high performance ML inferencing and training accelerator"
arch=('x86_64')
url="https://www.onnxruntime.ai/"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=("onnxruntime")
conflicts=("onnxruntime")
replaces=()
backup=()
options=()
source=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz"
        "onnxruntime.zip::https://github.com/microsoft/onnxruntime/archive/refs/tags/v${pkgver}.zip")
noextract=()
md5sums=('9a3b855e2b22ace4ab110cec10b38b74'
         '5aaf5691732a05fb1a25d0840ac90dd8')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

package() {
    mkdir -p "${pkgdir}/usr/include/onnxruntime"
    mkdir -p "${pkgdir}/usr/lib"
    cp -r "${srcdir}/onnxruntime-${pkgver}/include/onnxruntime"/* "${pkgdir}/usr/include/onnxruntime"
    cp -r "${srcdir}/onnxruntime-linux-x64-${pkgver}/include"/* "${pkgdir}/usr/include/onnxruntime"
    cp "${srcdir}/onnxruntime-linux-x64-${pkgver}/lib"/* "${pkgdir}/usr/lib/"
}
