# Maintainer: Voxel <voxel.aur@gmail.com>
pkgname=resistor-decoder
pkgver=1.0
pkgrel=1
pkgdesc="Qt GUI tool for through-hole resistors and SMD parts."
arch=("any")
url="https://github.com/VoxelCubes/ResistorDecoder"
license=('GPL')
depends=("pyside6" "python>=3.6.0" "qt6-svg")
makedepends=("python-setuptools")
realpkgname=ResistorDecoder
source=("${realpkgname}-$pkgver.tar.gz::${url}/releases/download/${pkgver}/${realpkgname}-$pkgver.tar.gz")
sha256sums=("SKIP")


package() {
    cd "${srcdir}/${realpkgname}/"

    python setup.py install --root="${pkgdir}/" --optimize=1

    mkdir -p "$pkgdir/usr/share/applications"
    install --mode=644 --owner=root --group=root "ResistorDecoder.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    install --mode=644 --owner=root --group=root "resistor_decoder.png" "$pkgdir/usr/share/pixmaps/resistor_decoder.png"
}
