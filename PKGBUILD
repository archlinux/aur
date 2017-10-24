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
sha256sums=("33aa5c82caeaec7e6212019613a3d92e73f51431589ac1d6b3f851fa0b51295b")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake . -DSYSTEM_INSTALL=1
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
}
 
