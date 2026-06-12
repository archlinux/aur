# Maintainer: Boteium <Boteium@users.noreply.github.com>
pkgname=muon-pdf
pkgver=1.0.7.r1.g55611cc
pkgrel=1
pkgdesc="Touchscreen-first lightweight PDF reader with fast tap/swipe page turns, made for music sheets and books on tablets"
arch=('x86_64' 'aarch64')
url="https://github.com/Boteium/muon-pdf"
license=('GPL-3.0-or-later')
depends=('gtk4' 'mupdf')
makedepends=('git' 'zig')
options=('!debug')
source=("git+https://github.com/Boteium/muon-pdf.git#branch=zig0.16")
sha256sums=('SKIP')

pkgver() {
  cd muon-pdf
  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd muon-pdf
  make
}

package() {
  cd muon-pdf
  make install DESTDIR="$pkgdir"
}
