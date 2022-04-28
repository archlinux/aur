# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributor: K900 <me@0upti.me>
pkgname=windows2usb
pkgver=0.2.1
pkgrel=2
pkgdesc="Windows 7/8/8.1/10 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS)"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache")
depends=("bash" "awk" "ntfs-3g" "dosfstools" "util-linux" "p7zip" "ms-sys" "wimlib")
makedepends=("git")

source=("git+https://github.com/ValdikSS/windows2usb.git#tag=${pkgver}"
		"https://github.com/pbatard/rufus/raw/v3.18/res/uefi/uefi-ntfs.img")
sha512sums=('SKIP'
            'bfdf696ffc967e93aebdd480b40a585e6d03b5660fd07ab9b06bfad6279e0b7f8e371b3c1d9081779721c1085faf86657bbc9003a7cb35b459f36e68743f3850')

package() {
	install -D -t "${pkgdir}/usr/share/${pkgname}/" -m 644 uefi-ntfs.img
	install -D -t "${pkgdir}/usr/bin/" -m 755 ${pkgname}/${pkgname}
}
# vim: ts=4 sw=4:
