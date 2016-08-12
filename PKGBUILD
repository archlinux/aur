# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=qm-dfu-util
pkgver=1.1.0
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
md5sums=('0fcde4fc6e8d75ee9b3ae5fbab2ed180')

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
