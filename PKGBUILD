# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.6.2
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
sha256sums=('c343c84db165880ebfcc53c93d60da14618e3460a5455d39820c1ec01a324536'
            'SKIP')
b2sums=('8f182e155220432a11e9fd4386fe2afd05c7b1ef7eb3fad1290f3413dcb5e813548209da9f366c1cf8a2274a06c5e17b0090171a82ce043582f8b1ec1700c579'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
