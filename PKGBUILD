#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=luckybackup
pkgver=0.5.0
pkgrel=1
pkgdesc="Backup & Sync tool using Rsync and Qt5"
arch=('any')
url="http://luckybackup.sourceforge.net/"
license=('GPL3')
depends=( 'qt5-base' 'rsync' 'openssh')
provides=('luckybackup')
conflicts=('luckybackup-git')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/source/$pkgname-$pkgver.tar.gz")
sha256sums=('e801af2483cbdd62bc9af8e2ded252c51adbad81482e291042f58e21c3d4925b')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    qmake
    make
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make INSTALL_ROOT="${pkgdir}" install 
}
