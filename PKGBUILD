# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bug <Bug2000@gmail.com>
# Contributor: Marcel Wysocki <maci@satgnu.net>

pkgname=pidgin-otr
pkgver=3.2.0
pkgrel=3
pkgdesc='Off-the-Record Messaging plugin for Pidgin.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.cypherpunks.ca/otr/'
depends=('libotr>=3.2.0' 'pidgin' 'perlxml')
source=("http://www.cypherpunks.ca/otr/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('8af70b654b7d7c5a5b7785699ff562f9'
         '67d711a7a44cef2791f50b319aaf0e0e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
