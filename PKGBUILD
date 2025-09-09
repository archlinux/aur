# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=repair-usb-disc-gtk4
pkgver=0.1
pkgrel=0
pkgdesc="Simple GTK4 GUI tool to repair USB drives (NTFS, FAT32, exFAT)."
arch=('any')
url="https://gitlab.com/linux-stuffs/linux-goodies/-/tree/master/repair-usb-disc-gtk4"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('python' 'python-gobject' 'gtk4' 'util-linux' 'ntfs-3g' 'exfatprogs' 'dosfstools' 'repair-usb-disc')
optdepends=(
  'xfce4-terminal: default terminal emulator'
  'gnome-terminal: alternative terminal emulator'
  'konsole: alternative terminal emulator'
  'mate-terminal: alternative terminal emulator'
  'kitty: alternative terminal emulator'
  'alacritty: alternative terminal emulator'
  'xterm: alternative terminal emulator'
)
options=('!strip')
source=('https://gitlab.com/linux-stuffs/linux-goodies/-/raw/master/repair-usb-disc-gtk4/distrib/repair-usb-disc-gtk4-0.1-0.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
