# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributor: K900 <me@0upti.me>

pkgname=windows2usb
pkgver=0.2.4
pkgrel=1
pkgdesc="Windows 7/8/8.1/10/11 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS)"
arch=(any)
url="https://github.com/ValdikSS/windows2usb"
license=(Apache)
depends=(bash awk ntfs-3g dosfstools util-linux p7zip ms-sys wimlib)
makedepends=(git)
source=("git+https://github.com/ValdikSS/windows2usb.git#tag=${pkgver}"
		"https://github.com/pbatard/rufus/raw/v3.21/res/uefi/uefi-ntfs.img")
b2sums=('SKIP'
        '60d75a2281b4357af2bc511d4ea45f269c5dae06975eca00b158eb6321239ab7c0fae4fad4c1b57b0b2cd77a4a4409f4bdfe4c08c4ab111ac80a64d4d12cbc18')

package() {
  install -D -t "${pkgdir}/usr/share/${pkgname}/" -m 644 uefi-ntfs.img
  install -D -t "${pkgdir}/usr/bin/" -m 755 ${pkgname}/${pkgname}
}

# vim: ts=2 sw=2 et:
