pkgname=onnxruntime-lib-git
pkgver=1.12.1
pkgrel=1
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
# install=
source=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz"
        "$pkgname.zip::https://github.com/microsoft/onnxruntime/archive/refs/heads/main.zip")
noextract=()
md5sums=('SKIP'
         'SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

package() {
    mkdir -p "${pkgdir}/usr/include"
    mkdir -p "${pkgdir}/usr/lib"
    cp -r "${srcdir}/onnxruntime-main/include"/* "${pkgdir}/usr/include/"
    cp "${srcdir}/onnxruntime-linux-x64-${pkgver}/include"/* "${pkgdir}/usr/include/"
    cp "${srcdir}/onnxruntime-linux-x64-${pkgver}/lib"/* "${pkgdir}/usr/lib/"
}
