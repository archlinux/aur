# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=smartservogui
pkgver=0.97
pkgrel=1
pkgdesc="SmartServoGui is a fully featured Qt GUI application that helps you discover devices on available serial links, get an overview of all of their registers, and easily tweak their settings!"
arch=("i686" "x86_64")
url="https://github.com/emericg/SmartServoFramework/tree/master/gui"
license=("GPL3")
depends=("qt5-base" "qt5-svg")
makedepends=("qt5-tools")

source=("https://github.com/emericg/SmartServoFramework/archive/v${pkgver}.tar.gz")
sha256sums=('2c44cfcbc4dcd03819fd446ec1212c34940b18d1e97309947313114b4cc148f8')

build() {
  mkdir -p "SmartServoFramework-${pkgver}"
  cd "SmartServoFramework-${pkgver}/gui/"
  qmake -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "SmartServoFramework-${pkgver}/gui/"
  make DESTDIR="${pkgdir}" install
}

