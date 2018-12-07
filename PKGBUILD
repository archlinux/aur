# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

pkgname=ticcltools
pkgver=0.6
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
source=(https://github.com/LanguageMachines/ticcltools/archive/v0.6.tar.gz)
md5sums=(1adc2bb24f75038f6034ee742cdb4f10)

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
