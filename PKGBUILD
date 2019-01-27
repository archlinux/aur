# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=ical
pkgver=3.0.3
pkgrel=1
pkgdesc="ical is an old but popular calendar package written in Tcl by Sanjay Ghemawat for Unix systems."
url="https://launchpad.net/ical-tcl"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=(tcl tk)
optdepends=()
makedepends=(gcc make)
conflicts=()
replaces=()
backup=()
install=
source=("https://launchpad.net/ical-tcl/3.x/3.0.3/+download/ical-3.0.3.tar.gz")

md5sums=('0aa41a0501a7db8d4eb31867f68aa36b')

build() {
  tar xzf ical-${pkgver}.tar.gz
  cd ical-${pkgver}
  ./configure --prefix=/usr
  make
  }

package() {
  cd ical-${pkgver}
  make DESTDIR="${pkgdir}" install
  }
