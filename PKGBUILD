# Maintainer: K900 <me@0upti.me>
_pkgname=windows2usb
pkgname=${_pkgname}-git
pkgver=0.1.5
pkgrel=2

pkgdesc="Windows 7/8/8.1/10 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS)"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache")

depends=("bash" "awk" "ntfs-3g" "dosfstools" "util-linux" "p7zip" "ms-sys")

source=(
    "git+https://github.com/ValdikSS/windows2usb.git"
    "https://github.com/pbatard/rufus/raw/master/res/uefi/uefi-ntfs.img"
)
sha512sums=(
    "SKIP"
    "c4e26581b862c3c5dbe93c64dc9ba913c6ae1fa43b2c880872735b90822a22061dd6a1ca1378000ee34ca626622b4eca5b8d766abff04c5cb7437a372f85fbcf"
)

package() {
    install -Dm644 $srcdir/uefi-ntfs.img "$pkgdir/usr/share/$_pkgname/uefi-ntfs.img"
    install -Dm755 $srcdir/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
