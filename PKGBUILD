# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=libroxml
pkgver=3.0.2
pkgrel=1
pkgdesc="Tiny XML parsing library"
url="http://www.libroxml.net/"
arch=('x86_64' 'i686')
license=('LGPL')
depends=()
makedepends=('make' 'cmake')
source=("http://download.libroxml.net/pool/v3.x/libroxml-3.0.2.tar.gz")
md5sums=('901672549367d41bb2d55916bc21eac1')
_folder=${pkgname}-${pkgver}

build() {
  echo "${srcdir}/${_folder}"
  cd "${srcdir}/${_folder}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DBUILD_TESTING=Off
  make
}

package() {
  cd "${srcdir}/${_folder}"
  make DESTDIR="${pkgdir}" install
}
