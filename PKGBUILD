# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.8.15
pkgrel=1
pkgdesc="Set of bash script programs for building bootable images of Arch Linux"
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'erofs-utils' 'grub' 'libarchive' 'libisoburn' 'make' 'mtools' 'parted' 'squashfs-tools' 'syslinux')
optdepends=('devtools: for building ZFS packages'
            'edk2-ovmf: for emulating UEFI with aui-run'
            'erofs-utils: for experimental EROFS support in aui-mkiso'
            'f2fs-tools: for F2FS file system option'
            'openssl: for codesigning support when building netboot artifacts'
            'pacman-contrib: for building ZFS packages'
            'qemu-desktop: virtual machine for aui-run testings')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('f9c326f9ae89d08192fc99074c28e6d5e6dd335f1704ccb80fc9628a9e93fbfa'
            'SKIP')
b2sums=('c11ee365f51b98be6fe5532405aedfc3b76cef17a005f8a8e18d126e0dfe0343ac4ae5c2d450cf25515003e7b0b1a87349d77b4db2870958d17b1d45a705cf1e'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
