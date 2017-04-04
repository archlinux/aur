# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=libesedb
pkgver=20170121
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
sha1sums=('6b29b7e634953885c0716f144b278e7b2c64e9e3')

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
