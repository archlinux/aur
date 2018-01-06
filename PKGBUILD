# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=mrtg
pkgver=2.17.4
pkgrel=2
pkgdesc="Multi Router Traffic Grapher."
arch=('x86_64')
url="http://oss.oetiker.ch/mrtg/"
license=('GPL')
depends=('gd' 'perl')
source=("http://oss.oetiker.ch/mrtg/pub/${pkgname}-${pkgver}.tar.gz")
md5sums=('197565e97f97212eef7b414463c8d40c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed 's|LD_RUN_PATH=$(LD_RUN_PATH) ||g' -i Makefile.in
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix=${pkgdir}/usr install
}
