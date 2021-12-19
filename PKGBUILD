# Maintainer: Maarten van Gompel <proycon at anaproy.nl>
pkgname=toad
pkgver=0.7
pkgrel=1
pkgdesc="Toad: Trainer Of All Data, the Frog training collection"
arch=('i686' 'x86_64')
url="http://github.com/LanguageMachines/toad/"
license=('GPL3')
depends=('ticcutils' 'ucto' 'libfolia' 'icu' 'libxml2' 'timbl' 'mbt' 'mbtserver' 'frog' 'frogdata')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=(https://github.com/LanguageMachines/toad/archive/v0.7.tar.gz)
_gituser="LanguageMachines"
_gitname="toad"
md5sums=(785d2920c6b2c3bcc052fecfd5619c8b)

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


