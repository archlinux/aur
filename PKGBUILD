# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=libesedb
pkgver=20200418
pkgrel=1
pkgdesc='Library and tools to access the Extensible Storage Engine (ESE) Database File (EDB) format.'
url='https://github.com/libyal/libesedb'
arch=('any')
license=('LGPLv3+')
depends=('glibc')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("https://github.com/libyal/libesedb/releases/download/${pkgver}/libesedb-experimental-${pkgver}.tar.gz")
sha256sums=('184178eb825c43e502eae33730a40fc2ca14f8beae023ef525f9bbe407e19078')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
