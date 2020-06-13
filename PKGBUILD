pkgname=lc2kicad
pkgver=0.1.31
pkgrel=2
pkgdesc="A utility that converts EasyEDA files to KiCad files"
arch=('x86_64' 'i686' 'arm')
license=('LGPL3')
depends=()
optdepends=()
makedepends=('cmake')
url="https://github.com/RigoLigoRLC/LC2KiCad"
source=(git+https://github.com/RigoLigoRLC/LC2KiCad.git#commit=75f85b5)
md5sums=('SKIP')

build()
{
  cd "${srcdir}/LC2KiCad/"
  mkdir -p build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr/bin
  make
}

package()
{
  cd "${srcdir}/LC2KiCad/build"
  make DESTDIR="${pkgdir}" install
}
