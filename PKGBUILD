# Maintainer: Frederic Bezies <fredbezies@gmail.com>
# Work in progress PKGBUILD.

pkgname=artefetcher-qt4
_pkgname=artefetcher
pkgver=0.6.4
pkgrel=1
pkgdesc="A video grabber for Arte Catch UP TV - QT4 version"
arch=('i686' 'x86_64')
url="http://artefetcher.sourceforge.net/"
license=('GPL')
depends=('qt4')
makedepends=('qt4' 'libxkbcommon-x11')
provides=()
conflicts=(artefetcher-qt5)
replaces=()
backup=()
options=('!libtool' '!emptydirs')
source=(http://downloads.sf.net/sourceforge/$_pkgname/artefetcher_$pkgver.tar.gz)
md5sums=('8360d9b993e3061523feb3909bcac5b9')

build() {
  cd $_pkgname
  lrelease-qt4 arteFetcher_*.ts
  qmake-qt4 PREFIX=$pkgdir/usr/bin
  make
} 

package() {
   cd $_pkgname
   mkdir -p "$pkgdir"/usr/share/applications
   cp arteFetcher.desktop "$pkgdir"/usr/share/applications
   mkdir -p "$pkgdir"/usr/share/pixmaps
   cp img/arteFetcher.png "$pkgdir"/usr/share/pixmaps
   make DESTDIR="$pkgdir" install 
}



