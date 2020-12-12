# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=awale
pkgver=1.6
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

md5sums=('9e7dcfcc5a658a1c97a7c7e7a679cc33'
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
