# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.6.2.1
pkgrel=1
pkgdesc="Build iso images, create live usb drives, install on usb drives."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: for building ZFS packages'
            'edk2-ovmf: for emulating UEFI with aui_run'
            'f2fs-tools: for F2FS file system option'
            'pacman-contrib: for building ZFS packages'
            'qemu: virtual machine for aui_run')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('68aac6ee262d9ea1f81aa47b0524867f51ccefcea701d3b3c55049a439f75ec1'
            'SKIP')
b2sums=('d528efb3241608d6cb1b555aab6ee0b68bc382ab0c41aedb3be0f9b7dfa1579768f59ccad62dda9a3c2a2bbcff85487634df2e572eabade13615868457773814'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
