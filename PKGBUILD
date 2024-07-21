# Maintainer: IgorPetrovcm <igorpetrov42ru@gmail.com>
pkgname='smdbottom-git'
pkgver='2.1.1'
pkgrel=1
pkgdesc="A set of bottom libraries for simpledot"
arch=('x86_64')
url="https://github.com/IgorPetrovcm/smdbottom-git"
license=('MIT')
depends=('man-pages' 'util-linux' 'util-linux-libs')
makedepends=('git')
provides=('libsmdbottom.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/IgorPetrovcm/smdbottom/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
	tar -xvzf ${pkgname}-$pkgver.tar.gz
	cd ${pkgname}-"$pkgver"
	sh configure /usr
	sh install-dev /usr
}

package() {
	cd $pkgname-$pkgver
	make install clean
}
