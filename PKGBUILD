# Maintainer: Morten Linderd <morten@linderud.pw>
pkgname=bmusb
_commit=32043c95d3b9f8cb97d6d28b9996fa1bec2ce11b
pkgver=0.7.0
pkgrel=2
pkgdesc="a free driver for BlackMagic's Intensity Shuttle andUltraStudio SDI USB3 cards"
arch=('x86_64')
url="http://git.sesse.net/bmusb"
license=('GPL2')
depends=('libusb')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sesse.net/?p=bmusb;a=snapshot;h=${_commit};sf=tgz")
sha256sums=('85360f4a8ace6f7ee836c4062843bd873c3a25cd8266dc3fda8afe110bbddc08')

build() {
  cd "${pkgname}"-"${_commit:0:7}"
  make
}

package() {
  cd "${pkgname}"-"${_commit:0:7}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
