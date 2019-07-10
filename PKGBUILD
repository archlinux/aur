# Maintainer: Manuel Conzelmann <manolo89@online.de>
pkgname=rtl8822bu
pkgver=1
pkgrel=1
epoch=
pkgdesc="wireless lan driver for realtek devices like GigaBlue WLAN Stick 1200MBit Dual Band USB 3.0"
arch=(x86_64)
url="https://github.com/EntropicEffect/rtl8822bu"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/EntropicEffect/rtl8822bu/archive/master.zip")
noextract=()
md5sums=("70f004b6e99c32be2c185ffc89950162")
validpgpkeys=()


build() {
	cd "$pkgname-master"
	make
}

package() {
	cd "$pkgname-master"
	mv 88x2bu.ko $pkgname.ko
	install -m 755 -d $pkgdir/usr/lib/modules/$(uname -r)/
        install -p -m 644 $pkgname.ko $pkgdir/usr/lib/modules/$(uname -r)/
#        depmod -b $pkgdir -a
}
