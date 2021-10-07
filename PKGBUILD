# Maintainer: uint2048_t
pkgname=das-keyboard-q
pkgver=3.3.3
pkgrel=1
pkgdesc="Software for Das Keyboard 5Q, 5Qs, 4Q."
arch=('x86_64')
url=https://www.daskeyboard.io/get-started/software/
license=('CCPL')
options=('emptydirs')
source=("https://download.daskeyboard.com/q-software-releases/3.3.3/Das-Keyboard-Q_3.3.3.deb")
md5sums=('5214b5ef6dc4fe0faa4012154512cc9c')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	cd "${pkgdir}"
	cp usr/lib/das-keyboard-q/resources/app.asar.unpacked/assets/images/gray-q-icon.png usr/lib/das-keyboard-q/resources/app.asar.unpacked/assets/images/16x16.png
	mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s/\\/local// etc/systemd/system/das_keyboard_q-service.service
	rm -rf usr/local
	cd ..
}

