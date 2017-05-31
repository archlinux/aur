# Maintainer: Morten Linderd <morten@linderud.pw>

pkgname=bmusb
pkgver=0.5.2
pkgrel=2

pkgdesc="bmusb is a free driver for BlackMagic's Intensity Shuttle andUltraStudio SDI USB3 cards"
arch=(x86_64)
url="http://git.sesse.net/bmusb"
license=('GPLv2')

depends=('libusb')
makedepends=('gcc')
optdepends=()
provides=('bmusb')

source=("$pkgname.tar.gz::https://git.sesse.net/?p=bmusb;a=snapshot;h=1066d2975e1c824bef6b9c9555c7d9f4f1a890a9;sf=tgz")
sha256sums=('a10c1373aac3441cf70b5f7c103cba2edcb0303ca6277d35f23afdd1aeec4bdc')

build() {
  cd "$pkgname"-1066d29
  make
}

package() {
  cd "$pkgname"-1066d29
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
