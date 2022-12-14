# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: K900 <me@0upti.me>
pkgname=windows2usb-git
pkgver=0.2.4.r0.g68de917
pkgrel=1
pkgdesc="Windows 7/8/8.1/10/11 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS) - git version"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache-2")
depends=("bash" "awk" "ntfs-3g" "dosfstools" "util-linux" "p7zip" "ms-sys")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}"
		"https://github.com/pbatard/rufus/raw/master/res/uefi/uefi-ntfs.img")
sha256sums=('SKIP'
            '3d15257c21956efc566db9b11eb1b9f1fe176b379457c5689c90ed74c5fa00de')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -D -t "${pkgdir}/usr/share/${pkgname%-git}" -m 644 uefi-ntfs.img
	install -D -t "${pkgdir}/usr/bin" -m 755 "${pkgname%-git}/${pkgname%-git}"
}
# vim:set ts=4 sw=4 et:
