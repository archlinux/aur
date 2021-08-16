# Maintainer: K900 <me@0upti.me>
pkgname=windows2usb
pkgver=0.2
pkgrel=1

pkgdesc="Windows 7/8/8.1/10 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS)"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache")

depends=("bash" "awk" "ntfs-3g" "dosfstools" "util-linux" "p7zip" "ms-sys" "wimlib")

conflicts=("windows2usb-git")

source=(
    "git+https://github.com/ValdikSS/windows2usb.git#tag=${pkgver}"
    "https://github.com/pbatard/rufus/raw/v3.15/res/uefi/uefi-ntfs.img"
)
sha512sums=(
    "SKIP"
    "7413f02754e810c00bc59822314a34ec74663d6dfc441605ea8cd90cc0717db99953b32f30c1bac1b437ea9d3eabeaa7fd171497817642bb1abd728fb2c5290b"
)

package() {
    install -Dm644 $srcdir/uefi-ntfs.img "$pkgdir/usr/share/$pkgname/uefi-ntfs.img"
    install -Dm755 $srcdir/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}
