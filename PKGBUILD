# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=timblserver
pkgver=1.14
pkgrel=1
pkgdesc="Tilburg Memory Based Learner Server."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('timbl')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
options=(!libtool)
url="http://languagemachines.github.io/timbl"
_gituser="LanguageMachines"
_gitname="timblserver"
source=(https://github.com/LanguageMachines/timblserver/archive/v1.14.tar.gz)
md5sums=(c6b92ce7eb2c08180731e083c38c5af8)

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
