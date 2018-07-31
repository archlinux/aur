# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=smartservogui
pkgver=0.98
pkgrel=1
pkgdesc="SmartServoGui is a fully featured Qt GUI application that helps you discover devices on available serial links, get an overview of all of their registers, and easily tweak their settings!"
arch=("i686" "x86_64")
url="https://github.com/emericg/SmartServoFramework/tree/master/gui"
license=("GPL3")
depends=("qt5-base" "qt5-svg")
makedepends=("qt5-tools")

source=("https://github.com/emericg/SmartServoFramework/archive/v${pkgver}.tar.gz")
sha256sums=('2e3dcc667e7decde7e4e7b0b45c660029930c5cc339d288b0b454838ea89e0fb')

build() {
  mkdir -p "SmartServoFramework-${pkgver}"
  cd "SmartServoFramework-${pkgver}/SmartServoGui/"
  qmake -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "SmartServoFramework-${pkgver}/SmartServoGui/"
  make DESTDIR="${pkgdir}" install
}

