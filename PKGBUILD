# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Patryk Kowalczyk <patryk AT kowalczyk dot ws>
# Contributor: Robert Buhren <robert@robertbuhren.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethertricks dot net>
# Contributor: julian <pidanc_j at epita dot fr>

pkgname=tpm-tools
pkgver=1.3.9
pkgrel=1
pkgdesc="Tools to manage and diagnose a TPM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trousers"
license=('CPL')
depends=('trousers' 'opencryptoki')
source=(http://downloads.sourceforge.net/project/trousers/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('13a1cb29d38d449cbc44d6384630d4827cc6ddb2ec8d9baa207e75ec1b134864')

build() {
  # the tarball for 1.3.9 doesn't have a parent directory
  cd ${srcdir}/
  ./configure --prefix=/usr \
	            --mandir=/usr/share/man \
	            --enable-static \
	            --sbindir=/usr/bin
  make
}

package() {
  # the tarball for 1.3.9 doesn't have a parent directory
  cd ${srcdir}/
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
