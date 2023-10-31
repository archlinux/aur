# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=libfolia
pkgver=2.17
pkgrel=1
pkgdesc="C++ library for FoLiA (Format for Linguistic Annotation)"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils' 'icu' 'libxml2')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
options=(!libtool)
url="https://proycon.github.io/folia"
_gituser="LanguageMachines"
_gitname="libfolia"
source=(https://github.com/LanguageMachines/libfolia/archive/v2.17.tar.gz)
md5sums=(1cb7cdd02b384ef2b16945cb52a9f748)

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
