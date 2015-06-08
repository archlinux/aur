# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nathan Owe <ndowens.aur at gmail.com>

pkgname=amberfish
pkgver=1.6.4
pkgrel=3
pkgdesc="A general purpose text retrieval software"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/amberfish/"
license=('GPL2')
depends=('xerces-c')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('8eb3f1e26da9d0317719822539c3b932')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              LDFLAGS=''
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
