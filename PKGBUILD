# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nathan Owe <ndowens.aur at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=amberfish
pkgver=1.6.4
pkgrel=4
pkgdesc="A general purpose text retrieval software"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/amberfish/"
license=('GPL2')
depends=('xerces-c')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('155ac6e6b9b76fb7cbd94952548f718ab6add72c3b4fd2482d89abb39d96ce76')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              LDFLAGS=''
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
