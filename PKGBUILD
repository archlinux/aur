# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=slint-cpp-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Slint is a toolkit to efficiently develop fluid graphical user interfaces for any display: embedded devices and desktop applications"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-cpp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/Slint-cpp-$pkgver-Linux-$CARCH.tar.gz")
sha256sums=('9e4b0cecf27fb900099b0d108e553769f001d599d43dc968a5b62aeb0b8c3f3a')
depends=("freetype2" "qt5-base")

package() {
  cd Slint-cpp-$pkgver-Linux-$CARCH/
  mkdir -p ${pkgdir}/usr/
  cp -r . ${pkgdir}/usr/
  cp ${pkgdir}/usr/include/slint/* ${pkgdir}/usr/include/
  rm -rf ${pkgdir}/usr/include/slint/
}
