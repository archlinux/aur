# Maintainer: muhgoslav_klose <muhgo@muhgo.me>
# Contributor: jerry73204 <jerry73204@gmail.com>
pkgname=libesedb
pkgver=20240420
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
sha256sums=('07250741dff8a1ea1f5e38c02f1b9a1ae5e9fa52d013401067338842883a5b9f')

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
