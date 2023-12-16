# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=toolblex
pkgver=0.10
pkgrel=1
pkgdesc="A Bluetooth Low Energy device scanner and analyzer"
url="https://github.com/emericg/toolBLEx"
arch=("x86_64" "i686")
license=("GPL3")
depends=("qt6-base" "qt6-declarative" "qt6-quickcontrols2" "qt6-connectivity" "qt6-charts" "qt6-svg" "qt6-shadertools" "qt6-5compat")
makedepends=("qt6-tools")
optdepends=("bluez-utils: extra bluetooth infos")

source=("https://github.com/emericg/toolBLEx/archive/v${pkgver}.tar.gz")
sha256sums=('193e63e1928ab936e2febf4f308d4db464fac50fc3bf0ed9c9c518ffd3ab089a')

build() {
  cd "toolBLEx-${pkgver}"
  qmake6 -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "toolBLEx-${pkgver}"
  make DESTDIR="${pkgdir}" install
  #sudo setcap cap_net_admin,cap_net_raw=${pkgdir}/usr/bin/toolBLEx
}
