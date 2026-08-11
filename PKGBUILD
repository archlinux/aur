# Maintainer: Sándor Rátkai <sandor@ratk.ai>
pkgname=sandpaper-sudoku-gtk-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="GTK4 Sudoku application for ePaper devices with stylus input (pre-built binary)"
url='https://gitlab.com/sandpaper-project/sandpaper-sudoku/sandpaper-sudoku-gtk'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gtkmm-4.0' 'onnxruntime-cpu')
provides=('sandpaper-sudoku-gtk')
conflicts=('sandpaper-sudoku-gtk' 'sandpaper-sudoku-gtk-git')
source_x86_64=("sandpaper-sudoku-gtk-${pkgver}-x86_64.tar.gz::https://gitlab.com/api/v4/projects/84242371/packages/generic/binary/1.1.3/sandpaper-sudoku-gtk-${pkgver}-x86_64.tar.gz"
               "mnist-12.onnx::https://github.com/onnx/models/raw/main/validated/vision/classification/mnist/model/mnist-12.onnx")
source_aarch64=("sandpaper-sudoku-gtk-${pkgver}-aarch64.tar.gz::https://gitlab.com/api/v4/projects/84242371/packages/generic/binary/1.1.3/sandpaper-sudoku-gtk-${pkgver}-aarch64.tar.gz"
                "mnist-12.onnx::https://github.com/onnx/models/raw/main/validated/vision/classification/mnist/model/mnist-12.onnx")
sha256sums_x86_64=('d454f901ade81696c38c1390643c7f800619ced240ac06a9af431acc6d50f023'
                   '5c688690f8bacf667d4c2074af5ad0646ca328d7ab03eccf944a65b320171bdd')
sha256sums_aarch64=('9126e288f1e55f5db923d28c9f2d946cf4dc05375f7cfa63566aa66967663521'
                    '5c688690f8bacf667d4c2074af5ad0646ca328d7ab03eccf944a65b320171bdd')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
    install -Dm644 "${srcdir}/mnist-12.onnx" \
        "${pkgdir}/usr/share/sandpaper-sudoku-gtk/mnist-12.onnx"
}
