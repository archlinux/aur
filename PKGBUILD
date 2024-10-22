# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: blue_lizard lizard@blue.dyn-o-saur.com

pkgname=mmv
pkgver=2.9.1
pkgrel=1
pkgdesc="multiple move files"
source=(
  https://github.com/rrthomas/mmv/releases/download/v${pkgver}/mmv-${pkgver}.tar.gz
)
sha256sums=('7d18332e62a3ffb021121bd1bbad1e93183f36318206899bdf909a473275f3d0')

url="https://github.com/rrthomas/mmv"
license=(GPL-2.0-or-later)
install=$pkgname.install
arch=('i686' 'x86_64')

prepare() {
  cd "${srcdir}/$pkgname-$pkgver"
  ./configure --prefix /usr
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package(){
  cd "${srcdir}/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/share/man/man1/mmv.1"
}
