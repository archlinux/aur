# Maintainer: Danijel Tasov <aur@rbfh.de>
pkgname=qsf
pkgver=1.2.23
pkgrel=1
pkgdesc="small and fast bayesian spam filter"
url="https://ivarch.com/programs/qsf/"
license=('Artistic-2.0')
depends=('gdbm')
arch=('i686' 'x86_64')
validpgpkeys=('4267B4F90F2678A112169BD61D1EF7581B45E9A0')
source=(
  "https://ivarch.com/s/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.asc::https://ivarch.com/s/${pkgname}-${pkgver}.tar.gz.txt"
)
sha512sums=(
  'aac64400c37833d5d68d92a21c86899ba5b8ca6451858afa4bc562eafde98f99a99462d5f60635ee7fde8b04eac2780e598a6d30eb098ec6cabb6896073ba4d1'
  'SKIP'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --without-mysql
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=8 sts=2 ai sw=2 et:
