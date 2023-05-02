# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.7.8.1
pkgrel=1
pkgdesc="Create bootable disk images of Arch Linux, install to an external USB disk or thumb drive"
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
            'qemu-base: virtual machine for aui-run')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('af2813b2fb8218b489243a36de7c45dbc27ee17a3aff6c2819542744f6be6c5a'
            'SKIP')
b2sums=('6b605b886e67b2048d24e7cbcb308c9d7b139a0f5051ac864b20e218affdb23c9fe25460a615276c047c525213034511d4db8a69f30bf98723e58bcb1a7a6be9'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
