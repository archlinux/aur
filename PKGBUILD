# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=slint-cpp-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Slint is a toolkit to efficiently develop fluid graphical user interfaces for any display: embedded devices and desktop applications"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-cpp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/Slint-cpp-$pkgver-Linux-$CARCH.tar.gz")
md5sums=("d1d5286c3ecb68cf34ca0fb9474fe53d")
depends=("freetype2" "qt5-base")

package() {
  cd Slint-cpp-$pkgver-Linux-$CARCH/
  mkdir -p ${pkgdir}/usr/
  cp -r . ${pkgdir}/usr/
  cp ${pkgdir}/usr/include/slint/* ${pkgdir}/usr/include/
  rm -rf ${pkgdir}/usr/include/slint/
}
