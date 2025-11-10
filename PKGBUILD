# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

# Build Options
_boot_dir=${boot_dir:-/boot}
_efi_dir=${efi_dir:-/boot/EFI}

pkgname=netbootxyz-systemd-boot
pkgver=2.0.89
pkgrel=1
pkgdesc='netboot.xyz as systemd-boot loader entry'
arch=('x86_64')
url='https://netboot.xyz/'
license=('Apache-2.0')
depends=('systemd')
options=('!debug')
backup=("boot/loader/entries/netbootxyz.conf")
source=("https://github.com/netbootxyz/netboot.xyz/releases/download/${pkgver}/netboot.xyz.efi"
        "netbootxyz.conf")
b2sums=('263499633dd9af912bda8a8d047705cf93b566d0211632a795550d46943898d233580240a8f04594bdf6d4d9c714a2ef7efb1b6e736cd8b095a40303afb5c9af'
        '0d75be01199f04deae3a6bd0d40198b888ed6b60820fd81de26ed84730c033323a5694edf6e86e87e678f573204b209a6a3da690af303256661dedccbf50180b')

package() {
  install -d "${pkgdir}"/"${_efi_dir}"/netbootxyz
  install "${srcdir}"/netboot.xyz.efi "${pkgdir}"/"${_efi_dir}"/netbootxyz/netbootxyz.efi
  install -d -m 755 "${pkgdir}"/"${_boot_dir}"/loader/entries
  install netbootxyz.conf "${pkgdir}"/"${_boot_dir}"/loader/entries/netbootxyz.conf
}
