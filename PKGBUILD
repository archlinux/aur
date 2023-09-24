# Maintainer: sant0s <diego.delossantos@mailbox.org>

pkgname=onnxruntime-bin
pkgver=1.16.0
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
sha256sums=('67b202d7451f22532e7191da83804729f6cf2ea2a500130cb4e39aa33ceacee9')
sha256sums_x86_64=('23d867eb2a778dd54c601778e5d2bcf45ceb76c5a82cc0144053c83f5d1f0005')
sha256sums_aarch64=('86138ee89f53e847a0dfacbef71b0272e64c20cf27aaebaaf3c37c39378d5b48')

package() {
    mkdir -p "${pkgdir}/usr/include/onnxruntime"
    mkdir -p "${pkgdir}/usr/lib"
    cp -r "${srcdir}/onnxruntime-${pkgver}/include/onnxruntime"/* "${pkgdir}/usr/include/onnxruntime"
    install -Dm644 "${srcdir}/onnxruntime-linux-x64-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -r "${srcdir}/onnxruntime-linux-x64-${pkgver}/include"/* "${pkgdir}/usr/include/onnxruntime"
    cp "${srcdir}/onnxruntime-linux-x64-${pkgver}/lib"/* "${pkgdir}/usr/lib/"
}

