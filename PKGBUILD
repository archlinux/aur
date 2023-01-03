# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=mbt
pkgver=3.9
pkgrel=1
pkgdesc="Memory-based tagger-generator and tagger in one."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.24' 'timbl' 'timblserver')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
options=(!libtool)
url="https://languagemachines.github.io/mbt"
_gituser="LanguageMachines"
_gitname="mbt"
source=(https://github.com/LanguageMachines/mbt/archive/v3.9.tar.gz)
md5sums=(af4c4d70684285f90b520171dc341000)

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

