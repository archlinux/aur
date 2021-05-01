# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.6.5
pkgrel=1
pkgdesc="Build desktop iso images, create live usb drives, install on usb drives."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: for building ZFS packages'
            'edk2-ovmf: for emulating UEFI with aui-run'
            'erofs-utils: for experimental EROFS support in aui-mkiso'
            'f2fs-tools: for F2FS file system option'
            'pacman-contrib: for building ZFS packages'
            'qemu: virtual machine for aui-run')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('5745c7abc0243914de6efebd63e15fac6fb2cc7587bbd0d321c302bac0834063'
            'SKIP')
b2sums=('2b0ce8b9b6ffc1a19b2beca8e0b19796488efb3887777cd3282a16e759e63fb342348ab4804b75ecfeddd48e690f27221940cdcdf3b8a0da48d9646826d47b73'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
