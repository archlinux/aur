#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=luckybackup
pkgver=0.4.9
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
sha256sums=('c161e98a11de5ad0a32a8e060e3fd45695a93ea3adf0581764a6b5d32e8da23b')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    qmake
    make
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make INSTALL_ROOT="${pkgdir}" install 
}
