# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.6.17.2
pkgrel=1
pkgdesc="Build desktop iso images, create bootable usb drives, install on usb drives."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux' 'grub')
optdepends=('devtools: for building ZFS packages'
            'edk2-ovmf: for emulating UEFI with aui-run'
            'erofs-utils: for experimental EROFS support in aui-mkiso'
            'f2fs-tools: for F2FS file system option'
            'openssl: for codesigning support when building netboot artifacts'
            'pacman-contrib: for building ZFS packages'
            'qemu-desktop: virtual machine for aui-run')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('af0a1cf0ad17b2d2ef4c198cf1adb4abb0e684900f19fc7d921b9d3dd1ad990f'
            'SKIP')
b2sums=('b9e70897cf5df68f42dbd8ec007e5e5464172cc90f91c2a699e1ca2f676947a502eb735069782d07bd3794a692f8347cea533ddf1853ccf4a2a0a4e20e523cd1'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
