# Contributor: Giuseppe Calà <jiveaxe@gmail.com>

_pkgbase=pacmanlogviewer
pkgname=$_pkgbase-qt5
pkgver=1.3.1
pkgrel=3
pkgdesc="Inspect pacman log file."
arch=('i686' 'x86_64')
url='https://www.linux-apps.com/content/show.php/Pacman+Log+Viewer?content=150484'
license=('GPL')
depends=('qt5-base')
source=("https://dl.opendesktop.org/api/files/download/id/1466643430/150484-$_pkgbase-$pkgver.tar.gz")
provides=("$_pkgbase")
replaces=("$_pkgbase")
conflicts=("$_pkgbase")
 
md5sums=('da1bb1c4573b20dc4d2ff764a25c0479')
 
package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_WITH_QT5=ON
    make
    make DESTDIR="$pkgdir" install
} 
