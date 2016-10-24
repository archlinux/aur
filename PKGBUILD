# Maintainer: Maarten van Gompel <proycon at anaproy.nl>
pkgname=toad
pkgver=1
pkgrel=1
pkgdesc="Toad: Trainer Of All Data, the Frog training collection"
arch=('i686' 'x86_64')
url="http://github.com/languagemachines/toad/"
license=('GPL3')
depends=('ticcutils' 'ucto' 'libfolia' 'icu' 'libxml2' 'timbl' 'mbt' 'frog' 'frogdata')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=(https://github.com/LanguageMachines/toad/archive/v0.3.1.tar.gz)
md5sums=('SKIP')

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


