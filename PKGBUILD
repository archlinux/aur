# Maintainer:  uffe < uffe at uffe dat org >

pkgname=hexcurse-ng
pkgver=1.70.0
pkgrel=1
pkgdesc="Versatile ncurses-based console hexeditor written in C"
arch=('i686' 'x86_64')
url="https://github.com/prso/hexcurse-ng/"
license=('GPL-2.0-only')
depends=('ncurses')
options=('!makeflags')
source=("${pkgname}-${pkgver}.tgz::https://github.com/prso/hexcurse-ng/archive/v${pkgver}.tar.gz")
sha256sums=('54d93391bc769173b7e584406e58aee1d01b56298a8acdd8abd9c90ccc1a7b5b')

prepare()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --mandir=/usr/share/man

  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

#
# EOF
#