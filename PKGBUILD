
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-polkitagent
pkgver=1.4
pkgrel=0
pkgdesc="Polkit Agent for theShell"
arch=("x86_64")
url="https://github.com/vicr123/ts-polkitagent"
license=('GPL3')
depends=('polkit-qt5' 'qt5-base' 'the-libs' 'qt5-x11extras')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/ts-polkitagent#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
