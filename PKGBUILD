# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=mbt
pkgver=3.11
pkgrel=1
pkgdesc="Memory-based tagger-generator and tagger in one."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.34' 'timbl' 'timblserver')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
options=(!libtool)
url="https://languagemachines.github.io/mbt"
_gituser="LanguageMachines"
_gitname="mbt"
source=(https://github.com/LanguageMachines/mbt/archive/v3.11.tar.gz)
md5sums=(a097e9090ce51521764dc0cb37469cb4)

build() {
  cd $srcdir/$pkgname-$pkgver
  export CXXFLAGS="-std=c++17"
  bash bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

