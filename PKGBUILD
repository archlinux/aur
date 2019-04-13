# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Bob Gregory <pathogenix@gmail.com>

pkgname=liblognorm
pkgver=2.0.6
pkgrel=1
pkgdesc="A fast-samples based normalization library for logs"
arch=('i686' 'x86_64')
url="https://www.liblognorm.com/"
license=('GPL2' 'Apache')
depends=('glibc' 'libestr' 'libfastjson')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rsyslog/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('594ea3318ef419cb7f21cf81c513db35a838b32207999a11a82b709da9ff9a2b')

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
