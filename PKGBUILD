# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bitstream-git
pkgver=1.6.r18.g526a92f
pkgrel=1
pkgdesc="A set of C headers allowing a simpler access to binary structures such as specified by MPEG, DVB, IETF, SMPTE, IEEE, SCTE, etc"
arch=('any')
url="https://www.videolan.org/developers/bitstream.html"
license=('MIT')
makedepends=('git')
provides=("bitstream=$pkgver")
conflicts=('bitstream')
source=("git+https://code.videolan.org/videolan/bitstream.git")
sha256sums=('SKIP')


pkgver() {
  cd "bitstream"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "bitstream"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/bitstream"
}
