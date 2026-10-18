# Maintainer: Sándor Rátkai <sandor@ratk.ai>
pkgname=sandpaper-sudoku-gtk-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="GTK4 Sudoku application for ePaper devices with stylus input (pre-built binary)"
url='https://gitlab.com/sandpaper-project/sandpaper-sudoku/sandpaper-sudoku-gtk'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gtkmm-4.0' 'onnxruntime-cpu')
provides=('sandpaper-sudoku-gtk')
conflicts=('sandpaper-sudoku-gtk-git')
source_x86_64=("sandpaper-sudoku-gtk-${pkgver}-x86_64.tar.gz::https://gitlab.com/api/v4/projects/84242371/packages/generic/binary/1.1.4/sandpaper-sudoku-gtk-${pkgver}-x86_64.tar.gz"
               "mnist-12.onnx::https://github.com/onnx/models/raw/main/validated/vision/classification/mnist/model/mnist-12.onnx")
source_aarch64=("sandpaper-sudoku-gtk-${pkgver}-aarch64.tar.gz::https://gitlab.com/api/v4/projects/84242371/packages/generic/binary/1.1.4/sandpaper-sudoku-gtk-${pkgver}-aarch64.tar.gz"
                "mnist-12.onnx::https://github.com/onnx/models/raw/main/validated/vision/classification/mnist/model/mnist-12.onnx")
sha256sums_x86_64=('16277366551a415e57c8d51d4d5165e0deb6818db5d4b931279c0624b7545057'
                   '5c688690f8bacf667d4c2074af5ad0646ca328d7ab03eccf944a65b320171bdd')
sha256sums_aarch64=('95af0eb40e8718736ad4b2d25fec5ab0fb869ba90c14241618365a7c8222c238'
                    '5c688690f8bacf667d4c2074af5ad0646ca328d7ab03eccf944a65b320171bdd')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
    install -Dm644 "${srcdir}/mnist-12.onnx" \
        "${pkgdir}/usr/share/sandpaper-sudoku-gtk/mnist-12.onnx"
}
