# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contribuor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=mbtserver
pkgver=0.13
pkgrel=1
pkgdesc="Memory-based tagger-generator and tagger server."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.13' 'timbl' 'timblserver' 'mbt')
makedepends=()
options=(!libtool)
url="https://languagemachines.github.io/mbt"
_gituser="LanguageMachines"
_gitname="mbtserver"
source=(https://github.com/LanguageMachines/mbtserver/archive/v0.13.tar.gz)
md5sums=(371b05004548ec5de3edcb50da6f1b56)

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

