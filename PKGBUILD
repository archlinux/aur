# Maintainer: OGrigorios <aur@giotas.io>
pkgname=katana-mk2-fxfloorboard-bin
pkgver=20260112
pkgrel=2
pkgdesc="Editing software for the Boss Katana MK2 guitar modelling and effects amplifier."
arch=('x86_64')
url="https://sourceforge.net/projects/fxfloorboard/files/KatanaFxFloorBoard/Katana%20FxFloorboard%20for%20MK2%20Desktop/"
license=('GPL3')
provides=("$pkgname")
source=("https://downloads.sourceforge.net/project/fxfloorboard/KatanaFxFloorBoard/Katana%20FxFloorboard%20for%20MK2%20Desktop/Katana_Mk2_FxFloorBoard_FW2_linux.tar.xz"
	"Katana-Mk2-FxFloorBoard"
	"Katana-Mk2-FxFloorBoard.desktop")
md5sums=('1665946a16639a08793c135ea58a7ec8'
         '93298b35e3eb6203f0a0cfa16439df25'
         '37dcd3de7cc60a4b8c30a5858ef776f2')

package() {
	mkdir -p "${pkgdir}"/opt/
	mkdir -p "${pkgdir}"/usr/bin/
	mkdir -p "${pkgdir}"/usr/share/applications/
	cp -r Katana_MK2_FxFloorBoard_linux "${pkgdir}"/opt/Katana_Mk2_FxFloorBoard
	# The bundled glibc (Ubuntu 2.39) conflicts with the system dynamic loader;
	# remove it so the system glibc is used instead.
	rm "${pkgdir}"/opt/Katana_Mk2_FxFloorBoard/lib/libc.so.6 \
	   "${pkgdir}"/opt/Katana_Mk2_FxFloorBoard/lib/libm.so.6
	cp Katana-Mk2-FxFloorBoard "${pkgdir}"/usr/bin/Katana-Mk2-FxFloorBoard
	cp Katana-Mk2-FxFloorBoard.desktop "${pkgdir}"/usr/share/applications/Katana-Mk2-FxFloorBoard.desktop
}
