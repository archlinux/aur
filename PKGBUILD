
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-polkitagent
pkgver=1.0
pkgrel=0
pkgdesc="Polkit Agent for theShell"
arch=("x86_64")
url="https://github.com/vicr123/ts-polkitagent"
license=('GPL3')
depends=('polkit-qt5')
makedepends=('qtchooser' 'git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/ts-polkitagent#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/lib"
	cp "$pkgname-$pkgver/ts-polkitagent" "$pkgdir/usr/lib/"
}
