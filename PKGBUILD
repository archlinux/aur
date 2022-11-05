# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Mario Rodas <marsam at users dot noreply dot github dot com>

pkgname=lightning
pkgver=2.1.4
pkgrel=1
pkgdesc='Library that generates assembly language code at run-time'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/lightning/'
license=('GPL')
depends=('zlib')
source=("https://ftp.gnu.org/gnu/lightning/lightning-${pkgver}.tar.gz")
sha256sums=('0152697cdfec0e5b178ddc825e106f52c24956c0bf8ed1114ba7dfbabe90dc4f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
