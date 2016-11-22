# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=qm-dfu-util
pkgver=1.3.0
pkgrel=1
pkgdesc="UART-based dfu-util for Quark MCUs"
arch=('x86_64' 'i686')
url="https://github.com/quark-mcu/qm-dfu-util"
license=('GPL2')
depends=()
provides=("${pkgname%-git}" 'dfu-util-qda')
conflicts=('qm-dfu-util-git')
replaces=('qm-dfu-util-git')
source=("https://github.com/quark-mcu/qm-dfu-util/archive/v$pkgver.tar.gz")
md5sums=('f5272e01fd23d0ce63f0281d359bfe44')

build() {
	cd "$pkgname-$pkgver"
    ./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
