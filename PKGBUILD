# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nathan Owe <ndowens.aur at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=amberfish
pkgver=2.2.0
pkgrel=1
pkgdesc="A general purpose text retrieval software"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/amberfish/"
license=('GPL2')
depends=('xerces-c')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nassibnassar/amberfish/archive/v${pkgver}.tar.gz")
sha256sums=('73ebf5a6b8105b41055c6ec6ed7c820621ef064414d190dad6c80b0f78fae175')
LANG=C

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
