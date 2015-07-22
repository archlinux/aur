pkgname=bviplus
pkgver=0.9.4
pkgrel=2
pkgdesc="Bviplus is an ncurses based hex editor with a vim-like interface."
arch=('i686' 'x86_64')
url="http://bviplus.sourceforge.net/"
license=("GPLv3")
depends=("ncurses")
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz")
md5sums=('b814929c439d2ec75cec2597540003e7')

prepare() {
  cd ${pkgname}-${pkgver}
  cp vf_backend.c vf_backend.c.orig
  sed -i -r 's,inline (void compute_percent_complete),\1,' vf_backend.c
}

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=${pkgdir}/usr install
}
