# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Bob Gregory <pathogenix@gmail.com>

pkgname=liblognorm
pkgver=2.0.9
pkgrel=1
pkgdesc="A fast-samples based normalization library for logs"
arch=('i686' 'x86_64')
url="https://www.liblognorm.com/"
license=('LGPL-2.1' 'Apache-2.0')
depends=('glibc' 'libestr' 'libfastjson')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rsyslog/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5ba04e808f6530592b699e0994fd00fab84c1e323885d9be6dc91f4919f57801')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
