# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=toolblex
pkgver=0.8
pkgrel=1
pkgdesc="A Bluetooth Low Energy device scanner and analyzer"
url="https://github.com/emericg/toolBLEx"
arch=("x86_64" "i686")
license=("GPL3")
depends=("qt6-base" "qt6-declarative" "qt6-quickcontrols2" "qt6-connectivity" "qt6-charts" "qt6-svg" "qt6-shadertools" "qt6-5compat")
makedepends=("qt6-tools")
optdepends=("bluez-utils: extra bluetooth infos")

source=("https://github.com/emericg/toolBLEx/archive/v${pkgver}.tar.gz")
sha256sums=('0626c3e4d39cf045d3d1eef7611fb468781d82ec7477542ecb70c77c22a4ac50')

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
