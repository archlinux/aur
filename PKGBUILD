# Maintainer: Frederic Bezies <fredbezies@gmail.com>
# Work in progress PKGBUILD.

pkgname=artefetcher-qt5
_pkgname=artefetcher
pkgver=0.7.0
pkgrel=2
pkgdesc="A video grabber for Arte Catch UP TV - QT5 version"
arch=('i686' 'x86_64')
url="http://artefetcher.sourceforge.net/"
license=('GPL')
depends=('qt5-script')
makedepends=('qt5-script' 'qt5-webkit' 'qt5-tools')
provides=()
conflicts=(artefetcher-qt4)
replaces=()
backup=()
options=('!libtool' '!emptydirs')
source=(http://downloads.sf.net/sourceforge/$_pkgname/artefetcher_$pkgver.tar.gz)
md5sums=('650c3ec91b22572af918d921e26a7f90')

build() {
  cd $_pkgname
  lrelease-qt5 arteFetcher_*.ts
  qmake-qt5 PREFIX=$pkgdir/usr/bin
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

