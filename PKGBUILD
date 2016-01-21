# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: amedico, cordovano, jessekornblum, lowej, mlevendo

pkgname=dc3dd
pkgver=7.2.641
pkgrel=1
pkgdesc="is a patch to the GNU dd program, this version has several features intended for forensic acquisition of data."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dc3dd/"
license=('GPL3')
makedepends=('autoconf' 'perl-locale-gettext')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/7.2/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7f50aadc38649845ab11014d11013928411c9d2128c941e9630939d4c28cae6d')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --libexecdir="/usr/lib/${pkgname}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
