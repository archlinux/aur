# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=awale
pkgver=1.5
pkgrel=1
pkgdesc="A free version of the classic african reflexion game."
url="http://www.nongnu.org/awale/index.html"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('sdl' 'tcl' 'tk')
optdepends=()
makedepends=(gcc make)
conflicts=()
replaces=()
backup=()
install=
source=("http://ftp.igh.cnrs.fr/pub/nongnu/awale/${pkgname}-${pkgver}.tar.gz")

md5sums=('579709384f038b75f31e26e3e490f60b'
         )

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
  }

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  chmod +x+x+x ${pkgdir}/usr/share/awale/xawale.tcl
  }
