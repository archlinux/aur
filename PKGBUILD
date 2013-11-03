# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh-genders
pkgver=2.29
pkgrel=1
pkgdesc='Parallel Distributed Shell'
url='http://code.google.com/p/pdsh/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'openssh' 'readline' 'genders')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("http://pdsh.googlecode.com/files/pdsh-${pkgver}.tar.bz2")
conflicts=('pdsh')
provides=('pdsh')
md5sums=('e3512d03e491de6f1a735ab0ff702108')

build() {
  cd "${srcdir}/pdsh-${pkgver}"
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --enable-ltdl-install \
              --with-ssh \
              --with-genders \
              --with-readline
  make
}

package() {
  cd "${srcdir}/pdsh-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rmdir "${pkgdir}/usr/sbin"
}

# vim:set ts=2 sw=2 et:
