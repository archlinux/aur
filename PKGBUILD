# Contributor: Kim Scarborough <sluggo@unknown.nu>

pkgname=unicorn-cal
pkgver=4.1
pkgrel=1
pkgdesc="Enhanced CLI calendar"
arch=('x86_64' 'aarch64')
url="http://unicorn.us.com/cal.html";
license=('custom:public domain')
source=("http://unicorn.us.com/pub/cal41.zip")
sha256sums=('96318b738970237832e4594cb363058f4243f54e86a5f1e06737fb5d02e6c298')
makedepends=('unzip')

build() {
	cd "cal41/src"
	make -f makefile.unx
}

package() {
	cd "cal41/src"
	mv cal unicorn-cal
	mv cal.1 unicorn-cal.1
	install -D -s -t ${pkgdir}/usr/bin/ unicorn-cal
	install -D -m 0644 -t ${pkgdir}/usr/share/man/man1/ unicorn-cal.1
}
