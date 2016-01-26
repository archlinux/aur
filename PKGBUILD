# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=libroxml
pkgver=2.3.0
pkgrel=1
pkgdesc="Tiny XML parsing library"
url="http://www.libroxml.net/"
arch=('x86_64' 'i686')
license=('LGPL')
depends=()
makedepends=('make' 'cmake')
source=("http://download.libroxml.net/pool/v2.x/libroxml-2.3.0.tar.gz")
md5sums=('a975f91be150f7a19168a45ce15769ca')
_folder=${pkgname}-${pkgver}

build() {
  cd "${srcdir}/${_folder}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "${srcdir}/${_folder}"
  make DESTDIR="${pkgdir}" install
}
