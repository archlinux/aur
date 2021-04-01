# Maintainer: robertfoster

pkgname=partclone-utils
pkgver=0.4.3
pkgrel=1
pkgdesc="Utility for use with partclone generated images."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/partclone-utils"
license=(GPL)
source=("${url}/files/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/$pkgname-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('1dc98b4f8f26cfd16674edf54e2e2e393efcb4b1269787b3616ca9e5f96d9030')
