# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: K900 <me@0upti.me>

pkgname=windows2usb-git
pkgver=0.1.6.r3.g35565d0
pkgrel=1
pkgdesc="Windows 7/8/8.1/10 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS) - git version"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache")
depends=("bash" "awk" "ntfs-3g" "dosfstools" "util-linux" "p7zip" "ms-sys")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/ValdikSS/windows2usb.git"
		"https://github.com/pbatard/rufus/raw/master/res/uefi/uefi-ntfs.img")
sha512sums=('SKIP'
            '7413f02754e810c00bc59822314a34ec74663d6dfc441605ea8cd90cc0717db99953b32f30c1bac1b437ea9d3eabeaa7fd171497817642bb1abd728fb2c5290b')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm644 ${srcdir}/uefi-ntfs.img "${pkgdir}/usr/share/${pkgname%-git}/uefi-ntfs.img"
	install -Dm755 ${srcdir}/${pkgname%-git}/${pkgname%-git} "${pkgdir}/usr/bin/${pkgname%-git}"
}
# vim:set ts=4 sw=4:
