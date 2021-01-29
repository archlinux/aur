# Maintainer: b10n <b10n@dittes.nl>

pkgname=gtetrinet-gtk3-git
pkgver=0.7.11.r107.g09e8db1
pkgrel=1
pkgdesc="A fork of GTetrinet using GTK3"
url="https://github.com/tatankat/gtetrinet"
arch=("x86_64")
license=("GPL2")
depends=("gtk3")
makedepends=("git")
provides=("gtetrinet")
conflicts=("gtetrinet")
source=("git+https://github.com/tatankat/gtetrinet.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/gtetrinet"
  git describe --long | sed 's/GTETRINET_//;s/_/./g;s/-/.r/;s/-/./'
}

prepare() {
  cd "${srcdir}/gtetrinet"
}

build() {
  cd "${srcdir}/gtetrinet"
  ./autogen.sh --prefix=/usr
  make
}

check() {
  cd "${srcdir}/gtetrinet"
  make -k check
}

package () {
  cd "${srcdir}/gtetrinet"
  make DESTDIR="${pkgdir}" install
}
