# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Carsten Abele <yonk@yonk.de>

pkgname=newspost
pkgver=2.1.1
pkgrel=4
pkgdesc="A usenet binary autoposter for unix"
url='http://newspost.unixcab.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("http://newspost.unixcab.org/download/${pkgname}-${pkgver}.tar.gz"
        'getline.patch')
sha1sums=('244f31c6e5aa8e41224310295e477ab4a8a17071'
          'c64d67627b72fea3bd23d2c81f2dbfbbddbd1fb2')

prepare() {
  patch -d "${pkgname}-${pkgver}" -Np1 -i ../getline.patch
}

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make -C "${pkgname}-${pkgver}" PREFIX="${pkgdir}/usr/" MANDIR="${pkgdir}/usr/share/man/man1" install
}
