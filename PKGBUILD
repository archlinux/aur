# Maintainer: Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor: Janne Haapsaari	<iki.fi: haaja>

pkgname=hfstospell
pkgver=0.3.0
pkgrel=2
pkgdesc='Helsinki Finite-State Transducer Technology (HFST) tools'
arch=('i686' 'x86_64')
url='http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/'
license=('APACHE')
depends=('libxml++' 'libarchive' 'libsigc++')
options=(!libtool)
source=(http://downloads.sourceforge.net/project/hfst/hfst/source/hfstospell-${pkgver}.tar.gz)
md5sums=('e28ed98558db5caf4ef8a9cc017443ab')

build() {
  cd "${srcdir}/hfstospell-${pkgver}"

  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/hfstospell-${pkgver}"

   make DESTDIR="${pkgdir}" install
}
