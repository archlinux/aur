# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

pkgname=ticcltools
pkgver=0.4
pkgrel=1
pkgdesc="Tools for TICCL: A spelling normalisation engine"
arch=('i686' 'x86_64')
url="https://github.com/LanguageMachines/ticcltools"
license=('GPL')
depends=('ticcutils>=0.15' 'icu' 'libxml2' 'libfolia>=1.7')
makedepends=('libtool' 'autoconf')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="ticcltools"
url="https://github.com/LanguageMachines/ticcltools"
source=(https://github.com/LanguageMachines/ticcltools/archive/v0.4.tar.gz)
md5sums=(90cae10e1738486dc022c7a517d59e51)

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
