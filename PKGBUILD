# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bug <Bug2000@gmail.com>
# Contributor: Marcel Wysocki <maci@satgnu.net>

pkgname=pidgin-otr
pkgver=4.0.0
pkgrel=2
pkgdesc='Off-the-Record Messaging plugin for Pidgin.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.cypherpunks.ca/otr/'
depends=('libotr>=4.0.0' 'pidgin' 'perlxml')
makedepends=('intltool')
source=("http://www.cypherpunks.ca/otr/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('eadb953376acc474e56041d4c12aa2c8'
         '8c70a2fc6f5f0480f32178742ba96498')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
