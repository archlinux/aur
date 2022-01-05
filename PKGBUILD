# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=libosc++
_pkgname=libOSC++
pkgver=0.10.2
pkgrel=1
pkgdesc='Library for handling OSC in C++'
arch=('x86_64')
depends=()
makedepends=()
conflicts=('libosc++-git')
url='https://github.com/duncanthrax/scream'
license=('LGPL')
#source=('git+https://github.com/voidseg/libOSCpp.git#commit=37cca6f0e6dce2d0cbeed9f087160dbbfd29e92f')
source=('http://www.rumori.de/do/libosc++/dl/libOSC++-0.10.2.tar.gz')
sha256sums=(e594c68a11bff1d53b340443615d03e89557dcfbe5d57ff4402d34d7ffa4af3c)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --enable-shared --enable-static --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
