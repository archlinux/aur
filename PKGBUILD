# Maintainer: Atterratio
pkgname=obs-gphoto
pkgver=0.3.0
pkgrel=1
pkgdesc="Allows connect DSLR cameras with obs-studio through gPhoto on Linux"
arch=('i686' 'x86_64')
url="https://github.com/Atterratio/obs-gphoto"
license=("GPL2")
depends=("obs-studio" "libgphoto2" "imagemagick")
makedepends=("cmake")
source=("https://github.com/Atterratio/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("f666a4318131e2df157fff125478357ed6cde1b7b2ab38cef002e843b509e8fa")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake . -DSYSTEM_INSTALL=1
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
}
 
