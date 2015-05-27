# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
pkgname=fist
pkgver=4.0
pkgrel=1
pkgdesc="Emphatic message generator"
arch=('i686' 'x86_64')
url="http://www.fourmilab.ch/fist/"
license=('custom:PublicDomain')
source=(http://www.fourmilab.ch/fist/${pkgname}-${pkgver}.tar.gz)
md5sums=('f59c4b52a04e1d13b077510cf66589e9')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
