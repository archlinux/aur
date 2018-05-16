# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

pkgname=foliautils
pkgver=0.9
pkgrel=1
pkgdesc="Tools for working with the FoLiA format, based on libfolia. *NOT* the same as Python package FoLiA-tools!"
arch=('i686' 'x86_64')
url="http://proycon.github.io/folia"
license=('GPL')
depends=('ticcutils' 'ucto>=0.9.4' 'libxml2' 'libfolia>=1.5' 'libexttextcat')
provides=('foliautils')
conflicts=('foliatools' 'foliautils')
makedepends=('libtool' 'autoconf')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="foliautils"
source=(https://github.com/LanguageMachines/foliautils/archive/v0.9.tar.gz)
md5sums=(fa623f74216a1c73e73c6c386b8247fa)

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
