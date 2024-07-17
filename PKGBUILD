# Maintainer: IgorPetrovcm <igorpetrov42ru@gmail.com>
pkgbase='smdbottom-git'
pkgname='smdbottom-git'
pkgver='1.0.0'
pkgrel=1
pkgdesc="A set of bottom libraries for simpledot"
arch=('x86_64')
url="https://github.com/IgorPetrovcm/smdbottom"
license=('MIT')
depends=('man-pages' 'util-linux' 'util-linux-libs')
makedepends=('git')
provides=('libsmdbottom.so')
source=("smdbottom-${pkgver}.tar.gz::https://github.com/IgorPetrovcm/smdbottom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
validpgpkeys=('SKIP')

prepare() {
	tar -xvzf smdbottom-$pkgver.tar.gz
	cd smdbottom-"$pkgver"
	sh configure
}

package() {
	cd smdbottom-"$pkgver"
	make PREFIX=/usr install
}
