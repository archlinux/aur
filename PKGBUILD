# Maintainer: uint2048_t
pkgname=das-keyboard-q
pkgver=3.3.2
pkgrel=1
pkgdesc="Software for Das Keyboard 5Q, 5Qs, 4Q."
arch=('x86_64')
url=https://www.daskeyboard.io/get-started/software/
license=('unknown')
options=('emptydirs')
source=("https://download.daskeyboard.com/q-software-releases/3.3.2/Das-Keyboard-Q_3.3.2.deb")
md5sums=('5ce70b66b2dd24a6b341f6ba68fc5042')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	cd "${pkgdir}"
	mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s/local//g etc/systemd/system/das_keyboard_q-service.service
	rm -rf usr/local
	cd ..
}

