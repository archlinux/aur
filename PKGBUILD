# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: amedico, cordovano, jessekornblum, lowej, mlevendo

pkgname=dc3dd
pkgver=7.2.646
pkgrel=1
pkgdesc="is a patch to the GNU dd program, this version has several features intended for forensic acquisition of data."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dc3dd/"
license=('GPL3')
makedepends=('autoconf' 'perl-locale-gettext')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}%20${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('c4e325e5cbdae49e3855b0849ea62fed17d553428724745cea53fe6d91fd2b7f')

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
