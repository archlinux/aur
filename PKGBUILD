# Maintainer: uint2048_t
pkgname=das-keyboard-q
pkgver=3.2.8
pkgrel=1
pkgdesc="Software for Das Keyboard 4/5Q."
arch=('x86_64')
url=https://www.daskeyboard.io/get-started/software/
license=('unknown')
options=('emptydirs')
source=("https://download.daskeyboard.com/q-software-releases/3.2.8/Das-Keyboard-Q_3.2.8.deb")
md5sums=('fb888ead37997f1b17d17f7fa042f461')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	cd "${pkgdir}"
	mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s/local//g etc/systemd/system/das_keyboard_q-service.service
	rm -rf usr/local
	cd ..
}

