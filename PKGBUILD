# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=isapnptools
pkgver=1.27
pkgrel=5
pkgdesc="Allow ISA Plug-And-Play devices to be configured on a Linux machine"
url="http://www.roestock.demon.co.uk/isapnptools/"
depends=('glibc')
arch=('x86_64')
license=('GPL')
options=('staticlibs')
#source=("ftp://metalab.unc.edu/pub/Linux/system/hardware/${pkgname}-${pkgver}.tgz")
source=("http://ibiblio.org/pub/Linux/system/hardware/${pkgname}-${pkgver}.tgz")
md5sums=('b997ba56583dc850fce9b93d658dfa0c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
