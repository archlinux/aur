# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Mario Rodas <marsam at users dot noreply dot github dot com>

pkgname=lightning
pkgver=2.2.2
pkgrel=1
pkgdesc='Library that generates assembly language code at run-time'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/lightning/'
license=('GPL')
depends=('binutils')
options=('!debug')
source=("https://ftp.gnu.org/gnu/lightning/lightning-${pkgver}.tar.gz")
sha256sums=('0aca8242dead17d62117bcfcb078e6a9ea856cc81742813c9e8394bcce73b3e2')

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
