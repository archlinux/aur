# Maintainer: zekeer (isoniazid@gmail.ru)

pkgname=libchardet-fresh
pkgver=1.0.4
pkgrel=1
pkgdesc="Mozilla's Universal Charset Detector C/C++ API"
arch=('i686' 'x86_64')
license=('MPL')
url="http://http.debian.net/debian/pool/main/libc/libchardet/"
depends=('gcc-libs' 'bash')
options=('!libtool')
source=("http://http.debian.net/debian/pool/main/libc/libchardet/libchardet_${pkgver}.orig.tar.bz2")
build() {
  cd "${srcdir}/libchardet-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --disable-static
  make
}

package() {
  cd "${srcdir}/libchardet-${pkgver}"
  make DESTDIR="${pkgdir}" install

}

md5sums=('93edadd9353325405d6e092127339f33')
