# Maintainer: Jimmy Aguilar  <spacibba@yandex.com>
# Contributor: VirtualTam    <virtualtam@flibidi.net>
# Contributor: Deon Spengler <deon.spengler@gmail.com>
# Contributor: Daniel Mulzer

pkgname=gnu-cobol
_pkgmaj=3.0
_pkgmin=rc1
_tarname="gnucobol-${_pkgmaj}-${_pkgmin}"

pkgver="${_pkgmaj}${_pkgmin}"
pkgdesc="The open source GNU COBOL compiler"
pkgrel=0
arch=('i686' 'x86_64' 'armv7h')
url="http://sourceforge.net/projects/open-cobol/"
license=('GPL')
depends=('db' 'gmp')
makedepends=('gcc' 'help2man')
options=('!libtool')
source=("http://sourceforge.net/projects/open-cobol/files/${pkgname}/${_pkgmaj}/${_tarname}.tar.xz")
md5sums=('83f296c1553cef1b062815ac53ae6a7d')

build() {
  cd "${srcdir}/${_tarname}"

  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/${_tarname}"
  make DESTDIR="${pkgdir}" install
}
