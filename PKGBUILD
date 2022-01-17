# Maintainer: Samuel Martins <s@smartins.ch>
pkgname=pajeng
pkgver=1.3.6
pkgrel=1.1
pkgdesc='PajeNG - Trace Visualization Tool'
url="https://github.com/schnorr/pajeng"
arch=('i686' 'x86_64')
license=('GPL-3.0')
source=('https://github.com/schnorr/pajeng/archive/refs/tags/1.3.6.tar.gz')
depends=()
makedepends=('cmake' 'boost' 'asciidoc' 'flex' 'bison')
md5sums=('4d371589c4f8d0309b68f81811c577e8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p b
  cd b
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  make DESTDIR="$pkgdir/" install
}
