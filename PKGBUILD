# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributor: K900 <me@0upti.me>
pkgname=windows2usb
pkgver=0.2.4
pkgrel=1
pkgdesc="Windows 7/8/8.1/10/11 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS)"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache-2")
depends=("bash" "awk" "ntfs-3g" "dosfstools" "util-linux" "p7zip" "ms-sys" "wimlib")
makedepends=("git")

source=("git+https://github.com/ValdikSS/windows2usb.git#tag=${pkgver}"
		"https://github.com/pbatard/rufus/raw/v3.21/res/uefi/uefi-ntfs.img")
sha512sums=('SKIP'
            '92fedfc1bfb0b7093cb191d75f24692f2a1b32970ab985e2b3903bc8d75d33dc9cdcda26d9afcc348992b32e8480840fec400a67d70a3287ac37abee0d06dff2')

package() {
	install -D -t "${pkgdir}/usr/share/${pkgname}/" -m 644 uefi-ntfs.img
	install -D -t "${pkgdir}/usr/bin/" -m 755 ${pkgname}/${pkgname}
}
# vim: ts=4 sw=4 et:
