# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.6.4
pkgrel=1
pkgdesc="Build iso images, create live usb drives, install on usb drives."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: for building ZFS packages'
            'edk2-ovmf: for emulating UEFI with aui_run'
            'erofs-utils: for experimental EROFS support in aui-mkiso'
            'f2fs-tools: for F2FS file system option'
            'pacman-contrib: for building ZFS packages'
            'qemu: virtual machine for aui_run')
conflicts=('archuseriso')
install=archuseriso.install
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('6882cb71e954a54ddcf0514dafb0f0b05663aaa995cd341c95fbbbf99e27168f'
            'SKIP')
b2sums=('2faf3bd8f5f6fed9ee6f5a302d38e76eae91eccb438482e6ed65d09df5856242e55808319e63d0cebd95030d61a707f5b3efa41aa98df5139a13dd90d494e6a1'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
