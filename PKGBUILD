# Maintainer: Atterratio
pkgname=obs-gphoto
pkgver=0.2.0
pkgrel=1
pkgdesc="Allows connect DSLR cameras with obs-studio through gPhoto on Linux"
arch=('i686' 'x86_64')
url="https://github.com/Atterratio/obs-gphoto"
license=("GPL2")
depends=("obs-studio" "libgphoto2" "imagemagick")
makedepends=("cmake")
source=("https://github.com/Atterratio/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("a7dc2ea88b066e2c39f3e3f09af43864c96d057f047de7de3c917ec77209e0e0")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake . -DSYSTEM_INSTALL=1
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
}
 
