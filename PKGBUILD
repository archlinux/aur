# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

# Build Options
_boot_dir=${boot_dir:-/boot}
_efi_dir=${efi_dir:-/boot/EFI}

pkgname=netbootxyz-systemd-boot
pkgver=2.0.88
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
b2sums=('eddd9be9967d9b9ce9bca80bbdabcf578d6bb99b3bd4bdcc0fe014d74de35642c1601c01961cd6a71e2e41b6ba5f47439d77f8ab2792390db6badf160f3f35dd'
        '0d75be01199f04deae3a6bd0d40198b888ed6b60820fd81de26ed84730c033323a5694edf6e86e87e678f573204b209a6a3da690af303256661dedccbf50180b')

package() {
  install -d "${pkgdir}"/"${_efi_dir}"/netbootxyz
  install "${srcdir}"/netboot.xyz.efi "${pkgdir}"/"${_efi_dir}"/netbootxyz/netbootxyz.efi
  install -d -m 755 "${pkgdir}"/"${_boot_dir}"/loader/entries
  install netbootxyz.conf "${pkgdir}"/"${_boot_dir}"/loader/entries/netbootxyz.conf
}
