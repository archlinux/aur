# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

pkgname=bsdiff-gui
pkgver=1
pkgrel=1
pkgdesc='GUI for bsdiff/bspatch binary diff tools'
arch=(x86_64)
url=https://github.com/Raflos10/PatchGUI
license=(BSD custom:bzip2)
depends=(qt5-base)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  https://github.com/Raflos10/PatchGUI/archive/refs/tags/1.tar.gz
  $pkgname.desktop
)
sha256sums=(
  b611d6cd998d4bf6c69ea05e23bff93021f3a6e3f31de2c23365228ac5e16252
  1a6db6fdd03576233dc0d78a793c1d16a2ee96f0d29df59fa92dedd8feb9fe5f
)

build() {
  qmake PatchGUI-$pkgver/BSDiff-GUI.pro
  make
}

package() {
  install -Dm755 BSDiff-GUI -t "$pkgdir"/usr/bin
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 PatchGUI-$pkgver/include/bsdifflib/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.bsdiff
  install -Dm644 PatchGUI-$pkgver/include/bsdifflib/bzip2/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.bzip2
}
