# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Maintainer Evgeniy Alexeev <esalexeev@gmail.com>

pkgname=libghemical-mpqc
_pkgname=libghemical
pkgver=3.0.0
pkgrel=2
pkgdesc="Library containing computational chemistry facility of ghemical. Version with enabled mpqc and mopac7"
arch=('i686' 'x86_64')
url="http://bioinformatics.org/ghemical/libghemical/"
license=('GPL')
depends=('gcc-libs' 'mopac7' 'mpqc-shared')
makedepends=('intltool>=0.40.0' 'openbabel')
conflicts=('libghemical')
provides=('libghemical')
options=(libtool staticlibs)
source=(http://bioinformatics.org/ghemical/download/release20111012/${_pkgname}-${pkgver}.tar.gz)
md5sums=('1d5c9c19bb119470d2bb41a7e681eafd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-mpqc --enable-mopac7
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
