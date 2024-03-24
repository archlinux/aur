# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributor: K900 <me@0upti.me>

pkgname=windows2usb
pkgver=0.2.4
_rufusver=4.4
pkgrel=3
pkgdesc='Windows 7/8/8.1/10/11 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS)'
arch=(any)
url='https://github.com/ValdikSS/windows2usb'
license=(Apache-2.0)
depends=(bash awk ntfs-3g dosfstools util-linux p7zip ms-sys wimlib)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
		    "uefi-ntfs-$_rufusver.img::https://github.com/pbatard/rufus/raw/v$_rufusver/res/uefi/uefi-ntfs.img")
b2sums=('0630d0de39f2e35c658eb86f9b86677e5a4d962b00c4e468d11574ff2bfb0df55e96abaf756a5553a8079c4ae20fcef5ee641a3da1d9b03ba8ede5bd404203f4'
        'a84dd2c7435cea34ec3344ef4d21a4e98eb9d980db456a63b8bda1e763f753f70eabe65230e9fdc6db217374c7702d37bc861a8be4a7b8c5ad9e7f3164b15722')

package() {
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname/ uefi-ntfs-$_rufusver.img
  install -Dm755 -t "$pkgdir"/usr/bin/ $pkgname-$pkgver/$pkgname
}

# vim: ts=2 sw=2 et:
