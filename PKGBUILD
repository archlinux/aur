# Maintainer: skuroedov <skuroedov@email.cz>

pkgname=arduino-pro-ide
pkgver=0.0.2
pkgrel=2
pkgdesc="IDE for Arduino development."
arch=('x86_64')
depends=('wget' 'tar')
url="https://github.com/arduino/arduino-pro-ide"
license=('EPLv2')

options=(!strip)

package() {
	wget -O arduino-pro-ide.tar.xz https://downloads.arduino.cc/arduino-pro-ide/arduino-pro-ide-0.0.2-alpha.preview-linux64.tar.xz
	tar -xvf arduino-pro-ide.tar.xz
	mkdir -p "${pkgdir}/opt/$pkgname"
	mv Arduino\ Pro\ IDE-v0.0.2-linux/* "${pkgdir}/opt/$pkgname"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/usr/bin/$pkgname" "${pkgdir}/opt/arduino-pro-ide/arudino.pro.ide"
	install -D -m755 "${pkdir}/opt" "/opt"
	install -D -m755 "${pkgdir}/usr/bin" "/usr/bin"
}
