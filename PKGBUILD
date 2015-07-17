# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

_srcname=vo-amrwbenc
pkgname=${_srcname}_p
pkgver=0.1.3
pkgrel=1
pkgdesc="VisualOn Adaptive Multi Rate Wideband (AMR-WB) encoder"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('APACHE')
depends=('glibc')
options=('!emptydirs' '!libtool')
conflicts=('vo-amrwbenc')
provides=('vo-amrwbenc')
replaces=()
source=("http://downloads.sourceforge.net/opencore-amr/${_srcname}-${pkgver}.tar.gz")
sha256sums=('5652b391e0f0e296417b841b02987d3fd33e6c0af342c69542cbb016a71d9d4e')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
