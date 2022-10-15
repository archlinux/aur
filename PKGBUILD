# Maintainer: Peter Semiletov peter.semiletov at gmail dot com
# Packager: Peter Semiletov 

pkgname=upsm
pkgver=3.0.0
pkgrel=1
pkgdesc="Qt-based ups monitor (front-end for upsc from Network UPS Tools)."
arch=('x86_64')
url="https://github.com/psemiletov/upsm"
license=('GPL')
depends=('qt6-base' 'gcc-libs')
#depends=('qt6-base' 'gcc-libs' 'desktop-file-utils')
makedepends=(cmake)


source=(https://github.com/psemiletov/upsm/archive/$pkgver.tar.gz)

#sha512sums=('86be61a8acff29e40151eea69ce790a16fce52082b0ebf356d19ebd32f512c33bee4e0f2d23911b31bd06353e067cce10a39e26bac773832ab2996b5bbe3eda2')
md5sums=(4d5f48905a8e45981c6307c2409fb27a)


prepare() {
  mkdir -p "${srcdir}/upsm-${pkgver}/build"
}

build() {
  cd "${srcdir}/upsm-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
 
  make
}

package(){
  cd "${srcdir}/upsm-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

