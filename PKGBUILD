# Maintainer: Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor: Janne Haapsaari	<iki.fi: haaja>

pkgname=hfstospell
pkgver=0.4.1
pkgrel=1
pkgdesc='Helsinki Finite-State Transducer Technology (HFST) tools'
arch=('i686' 'x86_64')
url='http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/'
license=('APACHE')
depends=('libxml++' 'libarchive' 'icu')
options=(!libtool)
source=(https://github.com/hfst/hfst-ospell/archive/v${pkgver}.tar.gz)
md5sums=('0cd7ab3498a6fb39c402a99eebe04e55')

build() {
  cd "${srcdir}/hfst-ospell-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/hfst-ospell-${pkgver}"

   make DESTDIR="${pkgdir}" install
}
