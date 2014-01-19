# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=psiconv
pkgver=0.9.8
pkgrel=15
pkgdesc="Converts Psion 5(MX) files to more commonly used file formats"
arch=('i686' 'x86_64')
url="http://software.frodo.looijaard.name/psiconv/"
license=('GPL')
depends=('imagemagick')
makedepends=('bc')
backup=('etc/psiconv/psiconv.conf')
source=("http://software.frodo.looijaard.name/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('8d7548e3c6b9cd408544736133728acd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
