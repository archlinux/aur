# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contribuor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=mbtserver
pkgver=0.14
pkgrel=1
pkgdesc="Memory-based tagger-generator and tagger server."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.24' 'timbl' 'timblserver' 'mbt')
makedepends=()
options=(!libtool)
url="https://languagemachines.github.io/mbt"
_gituser="LanguageMachines"
_gitname="mbtserver"
source=(https://github.com/LanguageMachines/mbtserver/archive/v0.14.tar.gz)
md5sums=(23506a15fdeef24d60aab79f4fac3509)

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

