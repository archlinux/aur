# Maintainer: Amish <contact at via dot aur>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=mrtg
pkgver=2.17.7
pkgrel=1
pkgdesc="Multi Router Traffic Grapher."
arch=('x86_64')
url="http://oss.oetiker.ch/mrtg/"
license=('GPL')
depends=('gd' 'perl')
source=("http://oss.oetiker.ch/mrtg/pub/${pkgname}-${pkgver}.tar.gz")
md5sums=('eada3870c0419e425299401486600d95')

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
