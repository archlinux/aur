# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

pkgname=ticcltools
pkgver=0.7.1
pkgrel=1
pkgdesc="Tools for TICCL: A spelling normalisation engine"
arch=('i686' 'x86_64')
url="https://github.com/LanguageMachines/ticcltools"
license=('GPL')
depends=('ticcutils>=0.22' 'icu' 'libxml2' 'libfolia>=2.5.1')
makedepends=('libtool' 'autoconf')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="ticcltools"
url="https://github.com/LanguageMachines/ticcltools"
source=(https://github.com/LanguageMachines/ticcltools/archive/v0.7.1.tar.gz)
md5sums=(a12cd99969e98deb60aa3d481d7c99ba)

build() {
  cd $srcdir/$pkgname-$pkgver
  bash bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
