# Maintainer: fordprefect <fordprefect@dukun.de>
# former Contributors: Daenyth, Giovanni Scafora, Tino Reichardt 

pkgname=vobcopy
pkgver=1.2.0
pkgrel=5
pkgdesc='Copies DVD .vob files to harddisk, decrypting them on the way'
arch=('i686' 'x86_64')
url="http://www.vobcopy.org/projects/c/c.shtml"
license=('GPL2')
depends=('libdvdread' 'libdvdcss')
options=('!docs')
source=(http://www.vobcopy.org/download/${pkgname}-${pkgver}.tar.bz2)
md5sums=('88f735ccd051093ff40dab4597bc586e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr/ MANDIR=/usr/share/man install
}

# vim:set ts=2 sw=2 et:
