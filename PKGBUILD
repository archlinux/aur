# Maintainer: Pranshu Tanwar "PranshuTG" <12345qwertyman12345@gmail.com>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=libnymphcast-git
pkgver=0.1.r2.gd5400e8
pkgrel=2
pkgdesc="Core functionality for a NymphCast client"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/MayaPosch/libnymphcast"
license=(BSD)
depends=(nymphrpc poco)
makedepends=(git)
provides=(libnymphcast)
conflicts=(libnymphcast)
source=("git+https://github.com/MayaPosch/libnymphcast")
sha256sums=('SKIP')

pkgver() {
  cd libnymphcast
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd libnymphcast
  make lib
}

package() {
  cd libnymphcast
  make DESTDIR="${pkgdir}" install
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}