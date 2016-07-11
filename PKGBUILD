# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contribuor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=mbtserver
pkgver=0.11
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
source=(https://github.com/LanguageMachines/mbtserver/archive/v0.11.tar.gz)
md5sums=(8cbabfd1f918c67315b4cecef18bc253)

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

