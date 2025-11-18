# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sven Hesse <drmccoy@drmccoy.de>

pkgname=xoreos-tools
pkgver=0.0.6
pkgrel=1
pkgdesc="Tools to help with xoreos development"
arch=(x86_64)
url="https://github.com/xoreos/xoreos-tools"
license=(GPL-3.0-or-later)
depends=(zlib xz libxml2 boost-libs)
makedepends=(git boost)
source=("git+https://github.com/xoreos/xoreos-tools.git#tag=v${pkgver}")
sha256sums=('eacf4678bdf789d91479203f98940be24d6412372456c48b9e33e1827c43128e')

prepare() {
  cd xoreos-tools
  ./autogen.sh
}

build() {
  cd xoreos-tools
  ./configure --with-release=AUR --with-lto --prefix=/usr
  make
}

package() {
  cd xoreos-tools
  make DESTDIR="$pkgdir/" install
}
