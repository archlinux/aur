# Maintainer: Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor: Janne Haapsaari	<iki.fi: haaja>

pkgname=hfstospell
pkgver=0.4.5
pkgrel=1
pkgdesc='Helsinki Finite-State Transducer Technology (HFST) tools'
arch=('i686' 'x86_64')
url='http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/'
license=('APACHE')
depends=('libxml++2.6' 'libarchive')
options=(!libtool)
source=(https://github.com/hfst/hfst-ospell/archive/v${pkgver}.tar.gz)
md5sums=('efeaa3808274bacb509292e3398c3eec')

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
