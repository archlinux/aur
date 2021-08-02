# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Felix Schindler <aur at schindlerfmily dot de>

pkgname=fntsample
pkgver=5.4
pkgrel=1
pkgdesc="PDF and PostScript font samples generator"
url="https://github.com/eugmes/fntsample"
license=('GPL3')
arch=(i686 x86_64)
depends=(cairo fontconfig freetype2 glib2 pango unicode-character-database perl-pdf-api2 perl-libintl-perl)
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/eugmes/fntsample/archive/release/${pkgver}.tar.gz")
sha256sums=('69eb3d83bce78b6610f4a8f19d089059079ebc475c36d456ebcb4c8add431166')

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../${pkgname}-release-${pkgver}

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR=${pkgdir} install
}
