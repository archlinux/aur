#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=luckybackup
pkgver=0.4.8
pkgrel=1
pkgdesc="Backup & Sync tool using Rsync and Qt4"
arch=('any')
url="http://luckybackup.sourceforge.net/"
license=('GPL3')
depends=( 'qt4' 'rsync' 'openssh')
provides=('luckybackup')
conflicts=('luckybackup-git')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/source/$pkgname-$pkgver.tar.gz")
md5sums=('f6dcf502c2f11b5d44837189bf00ee01')

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	make INSTALL_ROOT="${pkgdir}" install 
}
