# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: amedico, cordovano, jessekornblum, lowej, mlevendo

pkgname=dc3dd
pkgver=7.3.1
pkgrel=1
pkgdesc="is a patch to the GNU dd program, this version has several features intended for forensic acquisition of data."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dc3dd/"
license=('GPL3')
makedepends=('autoconf' 'perl-locale-gettext')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=("bd1b66d20a4020ab94b512e56d76cb5f86470d0216081586d596366927cb8d8b")
 
build() {
  cd "${pkgname}-${pkgver}"
  chmod u+x ./configure
  ./configure --prefix=/usr --libexecdir="/usr/lib/${pkgname}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
