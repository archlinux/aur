# Maintainer: Giovan Battista "giomba" Rolandi <giomba at glgprograms dot it>
pkgname=c2prog
pkgver=2.0.5
pkgrel=2
pkgdesc="Fast and easy-to-use programming tool for TI C2000 MCUs"
arch=('x86_64')
url="https://c2prog.com"
license=('custom')
depends=()
source=('https://c2prog.com/downloads/unpack_c2prog_2.0.5.run' 'c2prog-icon-128x128.png' 'c2prog.desktop')
sha256sums=('221651fcbd679f35ddb1b4f5a78f8374e4a2ccac768e02124dd519608ebc0e88' '0a35202e2865d620d306bee8b45455d7db005535d8aaf66610b6eb31a5819def' '5db9d89bbf009775f4cf079563eabf30b8b004a1c2eda51d44411dfb3139a211')

prepare() {
  # apply patches here
  true
}

build() {
  chmod +x unpack_c2prog_${pkgver}.run
  ./unpack_c2prog_${pkgver}.run
}

package() {
  mkdir -p ${pkgdir}/opt/c2prog
  cp -r ${srcdir}/c2prog_v2.x/* ${pkgdir}/opt/c2prog

  cp c2prog-icon-128x128.png ${pkgdir}/opt/c2prog

  mkdir -p ${pkgdir}/usr/share/applications
  cp c2prog.desktop ${pkgdir}/usr/share/applications
}

