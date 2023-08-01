# Maintainer: sant0s <diego.delossantos@mailbox.org>

pkgname=onnxruntime-bin
pkgver=1.15.1
pkgrel=3
pkgdesc="ONNX Runtime: cross-platform, high performance ML inferencing and training accelerator"
arch=('x86_64' 'aarch64')
url="https://www.onnxruntime.ai/"
license=('MIT')
provides=("onnxruntime")
conflicts=("onnxruntime")
source=("onnxruntime.zip::https://github.com/microsoft/onnxruntime/archive/refs/tags/v${pkgver}.zip")
source_x86_64=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz")
source_aarch64=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-aarch64-${pkgver}.tgz")
sha256sums=('55a3dcb9dc959a007e8d043509a9dc0b5dbccdfe9e7f8a5ea75f7add0a71e733')
sha256sums_x86_64=('5492f9065f87538a286fb04c8542e9ff7950abb2ea6f8c24993a940006787d87')
sha256sums_aarch64=('85272e75d8dd841138de4b774a9672ea93c1be108d96038c6c34a62d7f976aee')

package() {
    mkdir -p "${pkgdir}/usr/include/onnxruntime"
    mkdir -p "${pkgdir}/usr/lib"
    cp -r "${srcdir}/onnxruntime-${pkgver}/include/onnxruntime"/* "${pkgdir}/usr/include/onnxruntime"
    install -Dm644 "${srcdir}/onnxruntime-linux-x64-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -r "${srcdir}/onnxruntime-linux-x64-${pkgver}/include"/* "${pkgdir}/usr/include/onnxruntime"
    cp "${srcdir}/onnxruntime-linux-x64-${pkgver}/lib"/* "${pkgdir}/usr/lib/"
}

