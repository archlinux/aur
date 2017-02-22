# Maintainer: Fabio Di Matteo <pobfdm@gmail.com>
pkgname=pobvnc
pkgver=git
pkgrel=1
epoch=
pkgdesc="Pobvnc is an application that enables you to help other people behind a firewall."
arch=('i686' 'x86_64')
url="http://www.freemedialab.org/pobvnc/"
license=('GPL')
groups=('Network')
depends=('gtk2' 'x11vnc' 'tigervnc')
makedepends=('cmake')
checkdepends=()
optdepends=('curl')
provides=('pobvnc')
conflicts=('pobvnc')
replaces=()
backup=()
options=( 'strip')
install=
changelog=
#source=($pkgname-$pkgver.tar.gz)
noextract=()
source=(https://github.com/pobfdm/pobvnc/archive/master.zip)
md5sums=('SKIP') #generate with 'makepkg -g'


build() {
  cd "$srcdir/pobvnc-master"
  cmake .
  make
}


package() {
  cd "$srcdir/pobvnc-master"
  make DESTDIR="$pkgdir/" install
}
