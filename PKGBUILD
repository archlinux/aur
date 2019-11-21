# Contributor: Edgard Matthijs <ematthijs at skynet dot be>

pkgname=gfourcc
pkgver=0.1.2.r4.g4163fc4
pkgrel=1
pkgdesc="GTKMM3 Tool to change the FOURCC codec and description of an AVI file"
arch=('i686' 'x86_64')
url="https://github.com/gamegard68/gfourcc"
license=('GPL')
provides=('gfourcc')
conflicts=('gfourcc')
depends=('gtkmm3')
makedepends=('gnome-common' 'pkg-config')
source=("git+https://github.com/gamegard68/gfourcc.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}

  sh autogen.sh --prefix=/usr
  make
}

package() {
  cd ${pkgname}

  make DESTDIR=${pkgdir} install
}
