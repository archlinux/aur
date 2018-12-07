# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

pkgname=ticcutils
pkgver=0.20
pkgrel=1
pkgdesc="Common library with functions for tools developed at Tilburg Centre for Cognition and Communication (Tilburg University) and Centre for Language and Speech Technology (Radboud University Nijmegen)"
arch=('i686' 'x86_64')
url="https://github.com/LanguageMachines/ticcutils"
license=('GPL')
depends=('gcc-libs' 'libxml2' 'bzip2' 'libtar' 'boost')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="ticcutils"
source=(https://github.com/LanguageMachines/ticcutils/archive/v0.20.tar.gz)
noextract=()
md5sums=(39815713529a336ef2c4735c7c4e8ca3)

build() {
  cd $srcdir/$pkgname-$pkgver
  bash bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

