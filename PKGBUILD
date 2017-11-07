# Maintainer: Maarten van Gompel <proycon at anaproy.nl>
pkgname=toad
pkgver=0.4
pkgrel=1
pkgdesc="Toad: Trainer Of All Data, the Frog training collection"
arch=('i686' 'x86_64')
url="http://github.com/LanguageMachines/toad/"
license=('GPL3')
depends=('ticcutils' 'ucto' 'libfolia' 'icu' 'libxml2' 'timbl' 'mbt' 'frog' 'frogdata')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=(https://github.com/LanguageMachines/toad/archive/v0.4.tar.gz)
_gituser="LanguageMachines"
_gitname="toad"
md5sums=(de30c2728a6a28e868415c133cc8b7db)

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


