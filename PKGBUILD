# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libaacs-git
pkgver=0.8.0.7.g7780e4d
pkgrel=1
pkgdesc="Advanced Access Content System. (GIT version)"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.videolan.org/developers/libaacs.html"
depends=('libgcrypt')
makedepends=('git' 'flex' 'bison')
provides=('libaacs')
conflicts=('libaacs')
source=('git://git.videolan.org/libaacs.git')
sha1sums=('SKIP')

pkgver() {
  cd libaacs
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libaacs
  ./bootstrap
}

build() {
  cd libaacs
  ./configure --prefix=/usr
  make
}

package() {
  make -C libaacs DESTDIR="${pkgdir}" install
}
